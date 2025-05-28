import asyncio
from typing import Self

from sqlalchemy.ext.asyncio import create_async_engine, async_sessionmaker, AsyncSession
from sqlalchemy.orm import declarative_base, relationship, selectinload
from sqlalchemy import Column, Integer, String, BLOB, select, func, ForeignKey, Boolean, Float, case, JSON, distinct, Sequence, Select

from DBGenerator.DatabaseController import DatabaseController

DATABASE_URL = f"sqlite+aiosqlite:///{DatabaseController.get_current_db()}"
engine = create_async_engine(DATABASE_URL, echo=False)

Base = declarative_base()
AsyncSessionMaker = async_sessionmaker(engine, expire_on_commit=False)


def connection(method):
    async def wrapper(*args, **kwargs):
        async with AsyncSessionMaker() as session:
            try:
                return await method(*args, session=session, **kwargs)
            except Exception as e:
                await session.rollback()
                raise e
            finally:
                await session.close()

    return wrapper


class DB_Advancement(Base):
    __tablename__ = "Advancement"

    id = Column(Integer, primary_key=True)
    title = Column(String, nullable=False, index=True)
    description = Column(String, nullable=False, index=True)
    icon = Column(BLOB, nullable=False)
    type = Column(String, nullable=False, index=True)
    tab = Column(String, nullable=False, index=True)
    color = Column(Integer, nullable=False)
    frame = Column(String, nullable=False)
    mc_path = Column(String, nullable=False, unique=True)
    is_hidden = Column(Boolean, nullable=False, default=False)
    datapack = Column(String, nullable=False)
    is_addon = Column(Boolean, nullable=False, default=False)
    exp_count = Column(Integer, nullable=True, default=None)

    parent_id = Column(Integer, ForeignKey("Advancement.id"), nullable=True)
    parent = relationship("DB_Advancement", remote_side=[id])

    reward_id = Column(Integer, ForeignKey("Reward.id"), nullable=True, default=None)
    reward = relationship("DB_Reward")

    trophy_id = Column(Integer, ForeignKey("Trophy.id"), nullable=True, default=None)
    trophy = relationship("DB_Trophy", back_populates="advancement")

    alt_descriptions_id = Column(Integer, ForeignKey("AdvancementAltDescriptions.id"), nullable=True)
    alt_descriptions = relationship("DB_AdvancementAltDescriptions")

    wb_addon_id = Column(Integer, ForeignKey("WB_addon.id"), nullable=True)
    wb_addon = relationship("DB_WB_Addon")

    @classmethod
    def _build_filters(
            cls,
            title: str | None = None,
            description: str | None = None,
            adv_type: str | None = None,
            tab: str | None = None,
            datapack: str | None = None,
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
                    (title_col == title_lower, 1),
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
    def _build_adv_search_stmt(
            cls,
            title: str | None = None,
            description: str | None = None,
            adv_type: str | None = None,
            tab: str | None = None,
            datapack: str | None = None,
            has_exp: bool | None = None,
            has_reward: bool | None = None,
            has_trophy: bool | None = None,
            limit: int = 25,
            load_related: bool = False,
            randomize: bool = False,
            excluded_ids: list[int] | None = None
    ) -> Select[tuple[Self]]:

        filters, relevance = cls._build_filters(
            title=title, description=description, adv_type=adv_type, tab=tab, datapack=datapack, has_exp=has_exp,
            has_reward=has_reward, has_trophy=has_trophy, randomize=randomize, excluded_ids=excluded_ids)

        stmt = select(cls).where(*filters)

        if title and not randomize and relevance is not None:
            stmt = stmt.order_by(relevance)
        elif randomize:
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
    async def search_without_relations(
            cls, title: str | None = None,
            description: str | None = None,
            adv_type: str | None = None,
            tab: str | None = None,
            datapack: str | None = None,
            has_exp: bool | None = None,
            has_reward: bool | None = None,
            has_trophy: bool | None = None,
            randomize: bool = False,
            limit: int = 25,
            excluded_ids: list[int] | None = None,
            session: AsyncSession = None
    ) -> Sequence[Self]:
        stmt = cls._build_adv_search_stmt(title=title, description=description, adv_type=adv_type, tab=tab, datapack=datapack, excluded_ids=excluded_ids,
                                          has_exp=has_exp, has_reward=has_reward, has_trophy=has_trophy, limit=limit, randomize=randomize)
        result = await session.execute(stmt)
        return result.scalars().all()

    @classmethod
    @connection
    async def search_with_relations(
            cls, title: str | None = None,
            description: str | None = None,
            adv_type: str | None = None,
            tab: str | None = None,
            datapack: str | None = None,
            has_exp: bool | None = None,
            has_reward: bool | None = None,
            has_trophy: bool | None = None,
            randomize: bool = False,
            limit: int = 25,
            excluded_ids: list[int] | None = None,
            session: AsyncSession = None
    ) -> Sequence[Self]:
        stmt = cls._build_adv_search_stmt(title=title, description=description, adv_type=adv_type, tab=tab, datapack=datapack, has_exp=has_exp,
                                          has_reward=has_reward, has_trophy=has_trophy, limit=limit, randomize=randomize, excluded_ids=excluded_ids, load_related=True)
        result = await session.execute(stmt)
        return result.scalars().all()

    @classmethod
    @connection
    async def get_filtered_count(cls, title: str | None = None,
                                 description: str | None = None,
                                 adv_type: str | None = None,
                                 tab: str | None = None,
                                 datapack: str | None = None,
                                 has_exp: bool | None = None,
                                 has_reward: bool | None = None,
                                 has_trophy: bool | None = None,
                                 randomize: bool = False,
                                 excluded_ids: list[str] | None = None,
                                 session: AsyncSession = None) -> int:
        filters, _ = cls._build_filters(
            title=title,
            description=description,
            adv_type=adv_type,
            tab=tab,
            datapack=datapack,
            has_exp=has_exp,
            has_reward=has_reward,
            has_trophy=has_trophy,
            randomize=randomize,
            excluded_ids=excluded_ids
        )

        stmt = select(func.count()).select_from(cls).where(*filters)
        result = await session.execute(stmt)
        return result.scalar_one()

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
    async def get_random_titles(cls, limit: int = 25):
        return await cls._get_random_column_values(cls.title, limit)

    @classmethod
    async def get_random_descriptions(cls, limit: int = 25):
        return await cls._get_random_column_values(cls.description, limit)

    @classmethod
    @connection
    async def _search_distinct_column(
            cls,
            column,
            *,
            title: str | None = None,
            description: str | None = None,
            adv_type: str | None = None,
            tab: str | None = None,
            datapack: str | None = None,
            has_exp: bool | None = None,
            has_reward: bool | None = None,
            has_trophy: bool | None = None,
            randomize: bool = False,
            session: AsyncSession = None
    ):
        filters, _ = cls._build_filters(title=title, description=description, adv_type=adv_type, tab=tab, datapack=datapack, has_exp=has_exp, has_reward=has_reward, has_trophy=has_trophy,
                                        randomize=randomize)

        stmt = select(distinct(column)).where(*filters)
        result = await session.execute(stmt)
        return result.scalars().all()

    @classmethod
    @connection
    async def _search_distinct_column_bool(
            cls,
            column,
            *,
            title: str | None = None,
            description: str | None = None,
            adv_type: str | None = None,
            tab: str | None = None,
            datapack: str | None = None,
            has_exp: bool | None = None,
            has_reward: bool | None = None,
            has_trophy: bool | None = None,
            randomize: bool = False,
            session: AsyncSession = None
    ):
        filters, _ = cls._build_filters(title=title, description=description, adv_type=adv_type, tab=tab, datapack=datapack, has_exp=has_exp, has_reward=has_reward, has_trophy=has_trophy,
                                        randomize=randomize)

        stmt = select(distinct(case((column.is_not(None), True), else_=False))).where(*filters)

        result = await session.execute(stmt)
        return result.scalars().all()

    @classmethod
    async def search_titles(
            cls, title: str | None = None, description: str | None = None, adv_type: str | None = None, tab: str | None = None,
            datapack: str | None = None, has_exp: bool | None = None, has_reward: bool | None = None, has_trophy: bool | None = None, randomize: bool = False,
    ):
        return await cls._search_distinct_column(cls.title, title=title, description=description, adv_type=adv_type, tab=tab, datapack=datapack,
                                                 has_exp=has_exp, has_reward=has_reward, has_trophy=has_trophy, randomize=randomize)

    @classmethod
    async def search_descriptions(
            cls, title: str | None = None, description: str | None = None, adv_type: str | None = None, tab: str | None = None,
            datapack: str | None = None, has_exp: bool | None = None, has_reward: bool | None = None, has_trophy: bool | None = None, randomize: bool = False,
    ):
        return await cls._search_distinct_column(cls.description, title=title, description=description, adv_type=adv_type, tab=tab, datapack=datapack,
                                                 has_exp=has_exp, has_reward=has_reward, has_trophy=has_trophy, randomize=randomize)

    @classmethod
    async def search_tabs(
            cls, title: str | None = None, description: str | None = None, adv_type: str | None = None, tab: str | None = None,
            datapack: str | None = None, has_exp: bool | None = None, has_reward: bool | None = None, has_trophy: bool | None = None, randomize: bool = False,
    ):
        return await cls._search_distinct_column(cls.tab, title=title, description=description, adv_type=adv_type, tab=tab, datapack=datapack,
                                                 has_exp=has_exp, has_reward=has_reward, has_trophy=has_trophy, randomize=randomize)

    @classmethod
    async def search_types(
            cls, title: str | None = None, description: str | None = None, adv_type: str | None = None, tab: str | None = None,
            datapack: str | None = None, has_exp: bool | None = None, has_reward: bool | None = None, has_trophy: bool | None = None, randomize: bool = False,
    ):
        return await cls._search_distinct_column(cls.type, title=title, description=description, adv_type=adv_type, tab=tab, datapack=datapack,
                                                 has_exp=has_exp, has_reward=has_reward, has_trophy=has_trophy, randomize=randomize)

    @classmethod
    async def search_datapacks(
            cls, title: str | None = None, description: str | None = None, adv_type: str | None = None, tab: str | None = None,
            datapack: str | None = None, has_exp: bool | None = None, has_reward: bool | None = None, has_trophy: bool | None = None, randomize: bool = False,
    ):
        return await cls._search_distinct_column(cls.datapack, title=title, description=description, adv_type=adv_type, tab=tab, datapack=datapack,
                                                 has_exp=has_exp, has_reward=has_reward, has_trophy=has_trophy, randomize=randomize)

    @classmethod
    async def search_bool_attr(
            cls, attr, *, title: str | None = None, description: str | None = None, adv_type: str | None = None, tab: str | None = None,
            datapack: str | None = None, has_exp: bool | None = None, has_reward: bool | None = None, has_trophy: bool | None = None, randomize: bool = False,
    ):
        return await cls._search_distinct_column_bool(getattr(cls, attr), title=title, description=description, adv_type=adv_type, tab=tab, datapack=datapack,
                                                      has_exp=has_exp, has_reward=has_reward, has_trophy=has_trophy, randomize=randomize)

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


class DB_AdvancementAltDescriptions(Base):
    __tablename__ = "AdvancementAltDescriptions"
    id = Column(Integer, primary_key=True)
    hardcore = Column(String, nullable=True)
    terralith = Column(String, nullable=True)
    amplified_nether = Column(String, nullable=True)

    @connection
    async def save(self, session: AsyncSession):
        merged = await session.merge(self)
        await session.commit()
        return merged


class DB_Reward(Base):
    __tablename__ = "Reward"
    id = Column(Integer, primary_key=True)
    item_id = Column(String, nullable=False)
    amount = Column(Integer, nullable=False)

    @connection
    async def save(self, session: AsyncSession):
        merged = await session.merge(self)
        await session.commit()
        return merged


class DB_Trophy(Base):
    __tablename__ = "Trophy"
    id = Column(Integer, primary_key=True)
    name = Column(String, nullable=False)
    description = Column(String, nullable=False)
    color = Column(Integer, nullable=False)
    item_id = Column(String, nullable=False)
    icon = Column(BLOB, nullable=False)
    enchantments = Column(JSON, nullable=True)
    unbreakable = Column(Boolean, nullable=False, default=False)
    advancement = relationship("DB_Advancement", back_populates="trophy", uselist=False)

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
        title_col = func.lower(cls.name)

        relevance = case(
            (title_col == name_lower, 1),
            (title_col.like(name_lower + ' %'), 2),
            (title_col.like(name_lower + '%'), 3),
            (title_col.like('% ' + name_lower + ' %'), 4),
            (title_col.like(f"%{name_lower}%"), 5),
            else_=6
        )
        filters = [title_col.like(f"%{name_lower}%")]
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


class DB_WB_Addon(Base):
    __tablename__ = "WB_addon"
    id = Column(Integer, primary_key=True)
    bacap_blocks = Column(Float, nullable=True)
    bacap_seconds = Column(Integer, nullable=True)
    ed_blocks = Column(Float, nullable=True)
    ed_seconds = Column(Integer, nullable=True)

    @connection
    async def save(self, session: AsyncSession):
        merged = await session.merge(self)
        await session.commit()
        return merged


async def init_db():
    async with engine.begin() as conn:
        # Creating Database
        await conn.run_sync(Base.metadata.create_all)


if __name__ == "__main__":
    asyncio.run(init_db())
