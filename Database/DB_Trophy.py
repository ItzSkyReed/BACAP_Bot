from typing import TYPE_CHECKING, Self, Optional, TypedDict, Unpack

from sqlalchemy import select, case, Boolean, Integer, String, BLOB, func, JSON
from sqlalchemy.ext.asyncio import AsyncSession
from sqlalchemy.orm import mapped_column, Mapped, relationship, selectinload

from .Base import connection, Base
from .DB_Advancement import DB_Advancement

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
    @connection
    async def _get_random_column_values(
            cls,
            column,
            limit: int = 25,
            session: AsyncSession = None
    ):
        stmt = select(column).order_by(func.random()).limit(limit)
        result = await session.execute(stmt)
        return result.scalars().all()

    @classmethod
    async def get_random_names(cls, limit: int = 25):
        return await cls._get_random_column_values(cls.name, limit)

    @classmethod
    def _build_filters(cls, name: str):
        name_lower = name.lower()
        name_col = func.lower(cls.name)

        relevance = case(
            (name_lower == name_col, 1),
            (name_col.like(name_lower + ' %'), 2),
            (name_col.like(name_lower + '%'), 3),
            (name_col.like('% ' + name_lower + ' %'), 4),
            (name_col.like(f"%{name_lower}%"), 5),
            else_=6
        )
        filters = [name_col.like(f"%{name_lower}%")]
        return filters, relevance

    @classmethod
    def _build_search_stmt(
            cls,
            name: str,
            limit: int,
            load_related: bool = False
    ):
        filters, relevance = cls._build_filters(name)

        stmt = select(cls).where(*filters).order_by(relevance).limit(limit)

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
    async def search_without_relations(cls, name: str, limit: int = 25, session: AsyncSession = None):
        stmt = cls._build_search_stmt(name, limit)
        result = await session.execute(stmt)
        return result.scalars().all()

    @classmethod
    @connection
    async def search_with_relations(cls, name: str, limit: int = 25, session: AsyncSession = None):
        stmt = cls._build_search_stmt(name, limit, load_related=True)
        result = await session.execute(stmt)
        return result.scalars().all()

    @classmethod
    @connection
    async def search_names(cls, name: str, limit: int = 25, session: AsyncSession = None):
        filters, relevance = cls._build_filters(name)
        stmt = select(cls.name).where(*filters).order_by(relevance).limit(limit)
        result = await session.execute(stmt)
        return result.scalars().all()

    @connection
    async def save(self, session: AsyncSession):
        merged = await session.merge(self)
        await session.commit()
        return merged