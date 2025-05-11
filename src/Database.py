import asyncio
from typing import Self

from sqlalchemy.ext.asyncio import create_async_engine, async_sessionmaker, AsyncSession
from sqlalchemy.orm import declarative_base, relationship, selectinload
from sqlalchemy import Column, Integer, String, BLOB, select, func, ForeignKey, Boolean, Float, case, JSON

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
    def _build_search_stmt(cls, title: str, description: str | None, limit: int, load_related: bool = False):
        title_lower = title.lower()
        title_col = func.lower(cls.title)
        desc_col = func.lower(cls.description)

        relevance = case(
            (title_col == title_lower, 1),
            (title_col.like(title_lower + ' %'), 2),
            (title_col.like(title_lower + '%'), 3),
            (title_col.like('% ' + title_lower + ' %'), 4),
            (title_col.like(f"%{title_lower}%"), 5),
            else_=6
        )

        filters = [title_col.like(f"%{title_lower}%")]
        if description:
            filters.append(desc_col.like(f"%{description.lower()}%"))

        stmt = select(cls).where(*filters).order_by(relevance).limit(limit)

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
            cls, title: str, description: str | None = None, limit: int = 25, session: AsyncSession = None
    ):
        stmt = cls._build_search_stmt(title, description, limit)
        result = await session.execute(stmt)
        return result.scalars().all()

    @classmethod
    @connection
    async def search_with_relations(
            cls, title: str, description: str | None = None, limit: int = 25, session: AsyncSession = None
    ):
        stmt = cls._build_search_stmt(title, description, limit, load_related=True)
        result = await session.execute(stmt)
        return result.scalars().all()

    @classmethod
    @connection
    async def get_random_advancements(cls, limit: int = 25, session: AsyncSession = None):
        result = await session.execute(select(cls).order_by(func.random()).limit(limit))
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
    advancement = relationship("DB_Advancement", back_populates="trophy", uselist=False)

    @connection
    async def save(self, session: AsyncSession):
        merged = await session.merge(self)
        await session.commit()
        return merged

    @classmethod
    def _build_search_stmt(
            cls,
            name: str,
            description: str | None,
            limit: int,
            load_related: bool = False
    ):
        name_lower = name.lower()
        title_col = func.lower(cls.name)
        desc_col = func.lower(cls.description)

        relevance = case(
            (title_col == name_lower, 1),
            (title_col.like(name_lower + ' %'), 2),
            (title_col.like(name_lower + '%'), 3),
            (title_col.like('% ' + name_lower + ' %'), 4),
            (title_col.like(f"%{name_lower}%"), 5),
            else_=6
        )

        filters = [title_col.like(f"%{name_lower}%")]
        if description:
            filters.append(desc_col.like(f"%{description.lower()}%"))

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
    async def search_without_relations(
            cls, name: str, description: str | None = None, limit: int = 25, session: AsyncSession = None
    ):
        stmt = cls._build_search_stmt(name, description, limit)
        result = await session.execute(stmt)
        return result.scalars().all()

    @classmethod
    @connection
    async def search_with_relations(
            cls, name: str, description: str | None = None, limit: int = 25, session: AsyncSession = None
    ):
        stmt = cls._build_search_stmt(name, description, limit, load_related=True)
        result = await session.execute(stmt)
        return result.scalars().all()


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
