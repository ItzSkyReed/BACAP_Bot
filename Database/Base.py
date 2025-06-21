import functools

from sqlalchemy.ext.asyncio import create_async_engine, async_sessionmaker
from sqlalchemy.orm import declarative_base

from DBGenerator.DatabaseController import DatabaseController

DATABASE_URL = f"sqlite+aiosqlite:///{DatabaseController.get_current_db()}"
engine = create_async_engine(DATABASE_URL, echo=False)

Base = declarative_base()
AsyncSessionMaker = async_sessionmaker(engine, expire_on_commit=False)


def connection(method):
    @functools.wraps(method)
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


async def init_db():
    async with engine.begin() as conn:
        # Creating Database
        await conn.run_sync(Base.metadata.create_all)