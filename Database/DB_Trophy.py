from typing import TYPE_CHECKING, Self, Optional, TypedDict, Unpack

from sqlalchemy import select, case, Boolean, Integer, String, BLOB, func, JSON, Select, distinct, Sequence
from sqlalchemy.ext.asyncio import AsyncSession
from sqlalchemy.orm import mapped_column, Mapped, relationship, selectinload, InstrumentedAttribute

from .Base import connection, Base
from .DB_Advancement import DB_Advancement


class TrophySearchFilters(TypedDict, total=False):
    name: str
    description: str
    is_unbreakable: bool
    has_enchantments: bool
    randomize: bool
    excluded_ids: list[int]


class DB_Trophy(Base):
    __tablename__ = "Trophy"

    id: Mapped[int] = mapped_column(primary_key=True)
    name: Mapped[str] = mapped_column(String, nullable=False)
    description: Mapped[str] = mapped_column(String, nullable=False)
    color: Mapped[int] = mapped_column(Integer, nullable=False)
    item_id: Mapped[str] = mapped_column(String, nullable=False)
    icon: Mapped[bytes] = mapped_column(BLOB, nullable=False)
    enchantments: Mapped[dict | None] = mapped_column(JSON, nullable=True)
    unbreakable: Mapped[bool] = mapped_column(Boolean, nullable=False, default=False)

    advancement: Mapped[Optional["DB_Advancement"]] = relationship(
        "DB_Advancement", back_populates="trophy", uselist=False
    )

    @classmethod
    def _build_filters(
            cls,
            name: str | None = None,
            description: str | None = None,
            is_unbreakable: bool | None = None,
            has_enchantments: bool | None = None,
            randomize: bool = False,
            excluded_ids: list[str] | None = None
    ):
        filters = []
        relevance = None

        if name:
            name_lower = name.lower()
            name_col = func.lower(cls.name)

            filters.append(name_col.like(f"%{name_lower}%"))

            if not randomize:
                relevance = case(
                    (name_lower == name_col, 1),
                    (name_col.like(name_lower + ' %'), 2),
                    (name_col.like(name_lower + '%'), 3),
                    (name_col.like('% ' + name_lower + ' %'), 4),
                    (name_col.like(f"%{name_lower}%"), 5),
                    else_=6
                )

        if description:
            filters.append(func.lower(func.replace(cls.description, "\n", " ")).like(f"%{description.lower()}%"))

        if is_unbreakable is not None:
            filters.append(cls.unbreakable.is_(is_unbreakable))

        if has_enchantments is not None:
            filters.append(cls.enchantments.isnot(None) if has_enchantments else cls.enchantments.is_(None))

        if excluded_ids:
            filters.append(cls.id.not_in(excluded_ids))

        return filters, relevance

    @classmethod
    def _build_search_stmt(cls, limit: int = 25, load_related: bool = False, **trophy_filters: Unpack[TrophySearchFilters]) -> Select[tuple[Self]]:
        filters, relevance = cls._build_filters(**trophy_filters)

        stmt = select(cls).where(*filters)

        if trophy_filters.get('name') and not trophy_filters.get('randomize') and relevance is not None:
            stmt = stmt.order_by(relevance)
        elif trophy_filters.get('randomize'):
            stmt = stmt.order_by(func.random())

        stmt = stmt.limit(limit)

        if load_related:
            stmt = stmt.options(
                selectinload(cls.advancement),
                selectinload(cls.advancement, DB_Advancement.alt_descriptions),
                selectinload(cls.advancement, DB_Advancement.reward),
                selectinload(cls.advancement, DB_Advancement.parent),
                selectinload(cls.advancement, DB_Advancement.trophy),
                selectinload(cls.advancement, DB_Advancement.wb_addon)
            )

        return stmt

    @classmethod
    @connection
    async def _get_random_column_values(cls, column: InstrumentedAttribute, limit: int = 25, session: AsyncSession = None):
        stmt = select(column).order_by(func.random()).limit(limit)
        result = await session.execute(stmt)
        return result.scalars().all()

    @classmethod
    async def get_random_names(cls, limit: int = 25):
        return await cls._get_random_column_values(cls.name, limit)

    @classmethod
    async def get_random_descriptions(cls, limit: int = 25):
        return await cls._get_random_column_values(cls.description, limit)

    @classmethod
    @connection
    async def search_without_relations(cls, limit: int = 25, session: AsyncSession = None, **trophy_filters: Unpack[TrophySearchFilters]) -> Sequence[Self]:
        stmt = cls._build_search_stmt(**trophy_filters, limit=limit)
        result = await session.execute(stmt)
        return result.scalars().all()

    @classmethod
    @connection
    async def search_with_relations(cls, limit: int = 25, session: AsyncSession = None, **trophy_filters: Unpack[TrophySearchFilters]) -> Sequence[Self]:
        stmt = cls._build_search_stmt(**trophy_filters, limit=limit, load_related=True)
        result = await session.execute(stmt)
        return result.scalars().all()

    @classmethod
    @connection
    async def get_filtered_count(cls, session: AsyncSession = None, **trophy_filters: Unpack[TrophySearchFilters]) -> int:
        filters, _ = cls._build_filters(**trophy_filters)

        stmt = select(func.count()).select_from(cls).where(*filters)
        result = await session.execute(stmt)
        return result.scalar_one()

    @classmethod
    @connection
    async def _search_distinct_column(cls, column: InstrumentedAttribute, session: AsyncSession = None, **trophy_filters: Unpack[TrophySearchFilters]):
        filters, _ = cls._build_filters(**trophy_filters)

        stmt = select(distinct(column)).where(*filters)
        result = await session.execute(stmt)
        return result.scalars().all()

    @classmethod
    @connection
    async def _search_distinct_column_bool(cls, column: InstrumentedAttribute, session: AsyncSession = None, **trophy_filters: Unpack[TrophySearchFilters]):
        filters, _ = cls._build_filters(**trophy_filters)

        stmt = select(distinct(case((column.is_not(None), True), else_=False))).where(*filters)

        result = await session.execute(stmt)
        return result.scalars().all()

    @classmethod
    async def search_names(cls, **trophy_filters: Unpack[TrophySearchFilters]):
        return await cls._search_distinct_column(column=cls.name, **trophy_filters)

    @classmethod
    async def search_descriptions(cls, **trophy_filters: Unpack[TrophySearchFilters]):
        return await cls._search_distinct_column(column=cls.description, **trophy_filters)

    @classmethod
    async def search_bool_attr(cls, attr: str, **trophy_filters: Unpack[TrophySearchFilters]):
        return await cls._search_distinct_column_bool(column=getattr(cls, attr), **trophy_filters)

    @connection
    async def save(self, session: AsyncSession):
        merged = await session.merge(self)
        await session.commit()
        return merged
