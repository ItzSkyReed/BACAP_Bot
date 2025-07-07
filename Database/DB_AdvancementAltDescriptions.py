from sqlalchemy import String
from sqlalchemy.ext.asyncio import AsyncSession
from sqlalchemy.orm import Mapped, mapped_column

from .Base import Base, connection


class DB_AdvancementAltDescriptions(Base):
    __tablename__ = "AdvancementAltDescriptions"

    id: Mapped[int] = mapped_column(primary_key=True)
    hardcore: Mapped[str | None] = mapped_column(String, nullable=True)
    terralith: Mapped[str | None] = mapped_column(String, nullable=True)
    amplified_nether: Mapped[str | None] = mapped_column(String, nullable=True)

    @connection
    async def save(self, session: AsyncSession):
        merged = await session.merge(self)
        await session.commit()
        return merged