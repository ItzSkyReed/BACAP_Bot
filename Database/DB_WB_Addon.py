from sqlalchemy import Float, Integer
from sqlalchemy.ext.asyncio import AsyncSession
from sqlalchemy.orm import Mapped, mapped_column

from .Base import Base, connection


class DB_WB_Addon(Base):
    __tablename__ = "WB_addon"

    id: Mapped[int] = mapped_column(primary_key=True)
    bacap_blocks: Mapped[float | None] = mapped_column(Float, nullable=True)
    bacap_seconds: Mapped[int | None] = mapped_column(Integer, nullable=True)
    ed_blocks: Mapped[float | None] = mapped_column(Float, nullable=True)
    ed_seconds: Mapped[int | None] = mapped_column(Integer, nullable=True)

    @connection
    async def save(self, session: AsyncSession):
        merged = await session.merge(self)
        await session.commit()
        return merged