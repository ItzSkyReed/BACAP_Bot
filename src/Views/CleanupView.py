import discord

from src.Protocols.SupportsCleanup import SupportsCleanup


class CleanupView(discord.ui.View):
    def __init__(self, owner: SupportsCleanup, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self._owner = owner

    async def on_timeout(self):
        self.clear_items()
        self.stop()
        await self._owner.cleanup()
