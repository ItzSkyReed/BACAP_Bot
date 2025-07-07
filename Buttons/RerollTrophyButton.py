from typing import Callable

import discord


class RerollTrophyButton(discord.ui.Button):
    def __init__(self, callback: Callable, *args, **kwargs):
        super().__init__(label="Reroll Trophy", emoji="🔁", style=discord.ButtonStyle.primary, *args, **kwargs)
        self._callback = callback

    async def callback(self, interaction: discord.Interaction):
        await self._callback(interaction)