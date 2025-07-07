from typing import TypedDict, Self, Optional, TYPE_CHECKING, Unpack

from sqlalchemy import select, distinct, case, ForeignKey, Boolean, Integer, String, BLOB, func, Select, Sequence
from sqlalchemy.ext.asyncio import AsyncSession
from sqlalchemy.orm import mapped_column, Mapped, relationship, selectinload, InstrumentedAttribute

from .Base import connection, Base

if TYPE_CHECKING:
    from .DB_Trophy import DB_Trophy
    from .DB_Reward import DB_Reward
    from .DB_AdvancementAltDescriptions import DB_AdvancementAltDescriptions
    from .DB_WB_Addon import DB_WB_Addon


class AdvSearchFilters(TypedDict, total=False):
    title: str
    description: str
    adv_type: str
    tab: str
    datapack: str
    is_hidden: bool
    has_exp: bool
    has_reward: bool
    has_trophy: bool
    randomize: bool
    excluded_ids: list[int]


class DB_Advancement(Base):
    __tablename__ = "Advancement"

    id: Mapped[int] = mapped_column(primary_key=True)
    title: Mapped[str] = mapped_column(String, nullable=False, index=True)
    description: Mapped[str] = mapped_column(String, nullable=False, index=True)
    actual_requirements: Mapped[str | None] = mapped_column(String, nullable=True)
    icon: Mapped[bytes] = mapped_column(BLOB, nullable=False)
    type: Mapped[str] = mapped_column(String, nullable=False, index=True)
    tab: Mapped[str] = mapped_column(String, nullable=False, index=True)
    color: Mapped[int] = mapped_column(Integer, nullable=False)
    frame: Mapped[str] = mapped_column(String, nullable=False)
    mc_path: Mapped[str] = mapped_column(String, nullable=False, unique=True)
    is_hidden: Mapped[bool] = mapped_column(Boolean, nullable=False, default=False)
    datapack: Mapped[str] = mapped_column(String, nullable=False)
    is_addon: Mapped[bool] = mapped_column(Boolean, nullable=False, default=False)
    exp_count: Mapped[int | None] = mapped_column(Integer, nullable=True, default=None)

    parent_id: Mapped[int | None] = mapped_column(ForeignKey("Advancement.id"), nullable=True)
    parent: Mapped[Self | None] = relationship("DB_Advancement", remote_side="DB_Advancement.id")

    reward_id: Mapped[int | None] = mapped_column(ForeignKey("Reward.id"), nullable=True, default=None)
    reward: Mapped[Optional["DB_Reward"]] = relationship("DB_Reward")

    trophy_id: Mapped[int | None] = mapped_column(ForeignKey("Trophy.id"), nullable=True, default=None)
    trophy: Mapped[Optional["DB_Trophy"]] = relationship("DB_Trophy", back_populates="advancement")

    alt_descriptions_id: Mapped[int | None] = mapped_column(ForeignKey("AdvancementAltDescriptions.id"), nullable=True)
    alt_descriptions: Mapped[Optional["DB_AdvancementAltDescriptions"]] = relationship("DB_AdvancementAltDescriptions")

    wb_addon_id: Mapped[int | None] = mapped_column(ForeignKey("WB_addon.id"), nullable=True)
    wb_addon: Mapped[Optional["DB_WB_Addon"]] = relationship("DB_WB_Addon")

    @classmethod
    def _build_filters(
            cls,
            title: str | None = None,
            description: str | None = None,
            adv_type: str | None = None,
            tab: str | None = None,
            datapack: str | None = None,
            is_hidden: bool | None = None,
            has_exp: bool | None = None,
            has_reward: bool | None = None,
            has_trophy: bool | None = None,
            randomize: bool = False,
            excluded_ids: list[str] | None = None
    ):
        filters = []
        relevance = None

        if title:
            title_lower = title.lower()
            title_col = func.lower(cls.title)

            filters.append(title_col.like(f"%{title_lower}%"))

            if not randomize:
                relevance = case(
                    (title_lower == title_col, 1),
                    (title_col.like(title_lower + ' %'), 2),
                    (title_col.like(title_lower + '%'), 3),
                    (title_col.like('% ' + title_lower + ' %'), 4),
                    (title_col.like(f"%{title_lower}%"), 5),
                    else_=6
                )

        if description:
            filters.append(func.lower(cls.description).like(f"%{description.lower()}%"))

        if tab:
            filters.append(func.lower(cls.tab).like(f"%{tab.lower()}%"))

        if datapack:
            filters.append(func.lower(cls.datapack).like(f"%{datapack.lower()}%"))

        if adv_type:
            filters.append(func.lower(cls.type).like(f"%{adv_type.lower()}%"))

        if is_hidden is not None:
            filters.append(cls.is_hidden.is_(is_hidden))

        if has_exp is not None:
            filters.append(cls.exp_count.isnot(None) if has_exp else cls.exp_count.is_(None))

        if has_reward is not None:
            filters.append(cls.reward_id.isnot(None) if has_reward else cls.reward_id.is_(None))

        if has_trophy is not None:
            filters.append(cls.trophy_id.isnot(None) if has_trophy else cls.trophy_id.is_(None))

        if excluded_ids:
            filters.append(cls.id.not_in(excluded_ids))

        return filters, relevance

    @classmethod
    def _build_search_stmt(cls, limit: int = 25, load_related: bool = False, **adv_filters: Unpack[AdvSearchFilters]) -> Select[tuple[Self]]:
        filters, relevance = cls._build_filters(**adv_filters)

        stmt = select(cls).where(*filters)

        if adv_filters.get('title') and not adv_filters.get('randomize') and relevance is not None:
            stmt = stmt.order_by(relevance)
        elif adv_filters.get('randomize'):
            stmt = stmt.order_by(func.random())

        stmt = stmt.limit(limit)

        if load_related:
            stmt = stmt.options(
                selectinload(cls.alt_descriptions),
                selectinload(cls.reward),
                selectinload(cls.parent),
                selectinload(cls.trophy),
                selectinload(cls.wb_addon),
            )

        return stmt

    @classmethod
    @connection
    async def search_without_relations(cls, limit: int = 25, session: AsyncSession = None, **adv_filters: Unpack[AdvSearchFilters]) -> Sequence[Self]:
        stmt = cls._build_search_stmt(**adv_filters, limit=limit)
        result = await session.execute(stmt)
        return result.scalars().all()

    @classmethod
    @connection
    async def search_with_relations(cls, limit: int = 25, session: AsyncSession = None, **adv_filters: Unpack[AdvSearchFilters]) -> Sequence[Self]:
        stmt = cls._build_search_stmt(**adv_filters, limit=limit, load_related=True)
        result = await session.execute(stmt)
        return result.scalars().all()

    @classmethod
    @connection
    async def get_filtered_count(cls, session: AsyncSession = None, **adv_filters: Unpack[AdvSearchFilters]) -> int:
        filters, _ = cls._build_filters(**adv_filters)

        stmt = select(func.count()).select_from(cls).where(*filters)
        result = await session.execute(stmt)
        return result.scalar_one()

    @classmethod
    @connection
    async def _get_random_column_values(cls, column: InstrumentedAttribute, limit: int = 25, session: AsyncSession = None):
        stmt = select(column).order_by(func.random()).limit(limit)
        result = await session.execute(stmt)
        return result.scalars().all()

    @classmethod
    async def get_random_titles(cls, limit: int = 25):
        return await cls._get_random_column_values(cls.title, limit)

    @classmethod
    async def get_random_descriptions(cls, limit: int = 25):
        return await cls._get_random_column_values(cls.description, limit)

    @classmethod
    @connection
    async def _search_distinct_column(cls, column: InstrumentedAttribute, session: AsyncSession = None, **adv_filters: Unpack[AdvSearchFilters]):
        filters, _ = cls._build_filters(**adv_filters)

        stmt = select(distinct(column)).where(*filters)
        result = await session.execute(stmt)
        return result.scalars().all()

    @classmethod
    @connection
    async def _search_distinct_column_bool(cls, column: InstrumentedAttribute, session: AsyncSession = None, **adv_filters: Unpack[AdvSearchFilters]):
        filters, _ = cls._build_filters(**adv_filters)

        stmt = select(distinct(case((column.is_not(None), True), else_=False))).where(*filters)

        result = await session.execute(stmt)
        return result.scalars().all()

    @classmethod
    async def search_titles(cls, **adv_filters: Unpack[AdvSearchFilters]):
        return await cls._search_distinct_column(column=cls.title, **adv_filters)

    @classmethod
    async def search_descriptions(cls, **adv_filters: Unpack[AdvSearchFilters]):
        return await cls._search_distinct_column(column=cls.description, **adv_filters)

    @classmethod
    async def search_tabs(cls, **adv_filters: Unpack[AdvSearchFilters]):
        return await cls._search_distinct_column(column=cls.tab, **adv_filters)

    @classmethod
    async def search_types(cls, **adv_filters: Unpack[AdvSearchFilters]):
        return await cls._search_distinct_column(column=cls.type, **adv_filters)

    @classmethod
    async def search_datapacks(cls, **adv_filters: Unpack[AdvSearchFilters]):
        return await cls._search_distinct_column(column=cls.datapack, **adv_filters)

    @classmethod
    async def search_bool_attr(cls, attr: str, **adv_filters: Unpack[AdvSearchFilters]):
        return await cls._search_distinct_column_bool(column=getattr(cls, attr), **adv_filters)

    @classmethod
    @connection
    async def get_all_tabs(cls, session: AsyncSession = None):
        result = await session.execute(select(distinct(cls.tab)))
        return result.scalars().all()

    @classmethod
    @connection
    async def get_all_types(cls, session: AsyncSession = None):
        result = await session.execute(select(distinct(cls.type)))
        return result.scalars().all()

    @classmethod
    @connection
    async def get_all_datapacks(cls, session: AsyncSession = None):
        result = await session.execute(select(distinct(cls.datapack)))
        return result.scalars().all()

    @classmethod
    @connection
    async def get_adv_by_mc_path(cls, mc_path: str, session: AsyncSession) -> Self | None:
        result = await session.execute(select(cls).where(cls.mc_path == mc_path))
        return result.scalar_one_or_none()

    @classmethod
    @connection
    async def get_adv_by_id(cls, adv_id: int, session: AsyncSession) -> Self | None:
        result = await session.execute(
            select(cls).options(
                selectinload(cls.alt_descriptions),
                selectinload(cls.reward),
                selectinload(cls.parent),
                selectinload(cls.trophy),
                selectinload(cls.wb_addon),
            ).where(cls.id == adv_id))
        return result.scalar_one_or_none()

    @connection
    async def save(self, session: AsyncSession):
        merged = await session.merge(self)
        await session.commit()
        return merged
