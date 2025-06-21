from sqlalchemy import String, Integer
from sqlalchemy.ext.asyncio import AsyncSession
from sqlalchemy.orm import Mapped, mapped_column

from Database.Base import Base, connection


class DB_Reward(Base):
    __tablename__ = "Reward"

    id: Mapped[int] = mapped_column(primary_key=True)
    item_id: Mapped[str] = mapped_column(String, nullable=False)
    amount: Mapped[int] = mapped_column(Integer, nullable=False)

    @connection
    async def save(self, session: AsyncSession):
        merged = await session.merge(self)
        await session.commit()
        return merged