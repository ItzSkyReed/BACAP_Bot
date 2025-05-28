from io import BytesIO

import discord

from Buttons.ToAdvancementButton import ToAdvancementButton
from Buttons.ParentAdvancementButton import ParentAdvancementButton
from Buttons.TrophyButton import TrophyButton
from Database import DB_Advancement
from Embeds.AdvancementEmbed import AdvancementEmbed
from Embeds.TrophyEmbed import TrophyEmbed
from Protocols.SupportsCleanup import SupportsCleanup
from Views.CleanupView import CleanupView
from common import error_embed

class SearchAdvController(SupportsCleanup):
    def __init__(self, advancement: DB_Advancement):
        self._original_message: discord.InteractionMessage | None = None
        self._advancement = advancement
        self._view = CleanupView(owner=self, timeout=300)

        self._trophy_button = None
        self._parent_button = None
        self._back_to_advancement_button = None

        if self._advancement.parent_id:
            self._parent_button = ParentAdvancementButton(callback=self.on_parent_button_click) # We load parent button only if parent exists
            self._trophy_button = TrophyButton(callback=self.on_trophy_button_click) # We always load trophy button in this case, yes.
            self._back_to_advancement_button = ToAdvancementButton(callback=self.on_back_to_advancement_button_click) # Same for this button
        elif self._advancement.trophy_id:
                self._trophy_button = TrophyButton(callback=self.on_trophy_button_click) # We load trophy for advancement without parents only if trophy exists
                self._back_to_advancement_button = ToAdvancementButton(callback=self.on_back_to_advancement_button_click) # Same for this button

        self._file = None

    def _is_author_interaction(self, interaction: discord.Interaction) -> bool:
        return interaction.user.id == self._original_message.interaction_metadata.user.id

    def _update_advancement_view(self):

        # Parent
        if self._advancement.parent_id:
            if self._parent_button not in self._view.children:
                self._view.add_item(self._parent_button)
        else:
            self._view.remove_item(self._parent_button)

        # Trophy
        if self._advancement.trophy_id:
            if self._trophy_button not in self._view.children:
                self._view.add_item(self._trophy_button)
        else:
            self._view.remove_item(self._trophy_button)

        # Back to Advancement
        self._view.remove_item(self._back_to_advancement_button)

        # Embed
        self._current_embed = AdvancementEmbed(self._advancement)

        # File (Generally, Icon of embed)
        if self._advancement.icon:
            self._file = discord.File(BytesIO(self._advancement.icon), filename=f"{self._advancement.id}.png")
        else:
            self._file = None

    def _update_trophy_view(self):
        self._view.remove_item(self._parent_button)
        self._view.remove_item(self._trophy_button)

        self._view.add_item(self._back_to_advancement_button)

        # Embed
        self._current_embed = TrophyEmbed(self._advancement)

        # File (Generally, Icon of embed)
        if self._advancement.icon:
            self._file = discord.File(BytesIO(self._advancement.trophy.icon), filename=f"{self._advancement.trophy.id}.png")
        else:
            self._file = None

    async def send_advancement_view(self, ctx):
        self._update_advancement_view()
        await ctx.respond(embed=self._current_embed, view=self._view, file=self._file)
        self._original_message = await ctx.interaction.original_response()

    async def send_trophy_view(self, ctx: discord.ApplicationContext):
        self._update_trophy_view()
        await ctx.respond(embed=self._current_embed, view=self._view, file=self._file)
        self._author = ctx.author
        self._original_message = await ctx.interaction.original_response()

    async def on_parent_button_click(self, interaction: discord.Interaction):
        if not self._is_author_interaction(interaction):
            return await interaction.respond(embed=error_embed(title="Only author of the command can do that!"), ephemeral=True)

        self._advancement = await self._advancement.get_adv_by_id(self._advancement.parent_id)

        self._update_advancement_view()

        return await interaction.edit(embed=self._current_embed, view=self._view, file=self._file)

    async def on_trophy_button_click(self, interaction: discord.Interaction):
        if not self._is_author_interaction(interaction):
            return await interaction.respond(embed=error_embed(description="Only author of the command can do that", title="Oops!"), ephemeral=True)

        self._update_trophy_view()

        return await interaction.edit(embed=self._current_embed, view=self._view, file=self._file)

    async def on_back_to_advancement_button_click(self, interaction: discord.Interaction):
        if not self._is_author_interaction(interaction):
            return await interaction.respond(embed=error_embed(description="Only author of the command can do that", title="Oops!"), ephemeral=True)

        self._update_advancement_view()
        return await interaction.edit(embed=self._current_embed, view=self._view, file=self._file)

    async def cleanup(self):
        self._view = None
        self._parent_button = None
        self._trophy_button = None
        self._back_to_advancement_button = None
        self._advancement = None
        self._file = None
        await self._original_message.edit(view=self._view)
        self._original_message = None
