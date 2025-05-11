from typing import Protocol, runtime_checkable

@runtime_checkable
class SupportsCleanup(Protocol):
    async def cleanup(self) -> None:
        ...