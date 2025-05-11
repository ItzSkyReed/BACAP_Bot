from collections.abc import Callable

import discord


class ParentAdvancementButton(discord.ui.Button):
    """
    callback: function that will be called when a button is clicked
    """
    def __init__(self, callback: Callable, *args, **kwargs):
        super().__init__(label="Parent Advancement", emoji="🌳", style=discord.ButtonStyle.primary, *args, **kwargs)
        self._callback = callback

    async def callback(self, interaction: discord.Interaction):
        await self._callback(interaction)