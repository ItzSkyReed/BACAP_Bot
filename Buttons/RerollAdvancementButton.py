from typing import Callable

import discord


class RerollAdvancementButton(discord.ui.Button):
    def __init__(self, callback: Callable, *args, **kwargs):
        super().__init__(label="Reroll Advancement", emoji="🔁", style=discord.ButtonStyle.primary, *args, **kwargs)
        self._callback = callback

    async def callback(self, interaction: discord.Interaction):
        await self._callback(interaction)