import discord

from Buttons import RerollAdvancementButton
from Controllers.SearchController import SearchController
from Database import DB_Advancement
from common import error_embed


class RandomAdvController(SearchAdvController):
    def __init__(self, advancement: DB_Advancement, suitable_adv_count: int, search_params: dict[str, str]):
        super().__init__(advancement)

        self._suitable_adv_count = suitable_adv_count
        self._excluded_ids: list[int] | None = [advancement.id]
        self._search_params = search_params
        self._reroll_advancement_button = RerollAdvancementButton(callback=self.on_reroll_button_click)

    def __clear_reroll_info(self):
        self._view.remove_item(self._reroll_advancement_button)
        self._reroll_advancement_button = None
        self._suitable_adv_count = 0
        self._excluded_ids = None
        self._search_params = None

    async def on_parent_button_click(self, interaction: discord.Interaction):
        self.__clear_reroll_info()
        await super().on_parent_button_click(interaction)

    async def on_trophy_button_click(self, interaction: discord.Interaction):
        await super().on_trophy_button_click(interaction)

    async def on_reroll_button_click(self, interaction: discord.Interaction):
        if not self._is_author_interaction(interaction):
            return await interaction.respond(embed=error_embed(description="Only author of the command can do that", title="Oops!"), ephemeral=True)

        self._advancement = (await DB_Advancement.search_with_relations(**self._search_params, limit=1, randomize=True, excluded_ids=self._excluded_ids))[0]

        self._excluded_ids.append(self._advancement.id)
        self._suitable_adv_count -= 1

        self._update_advancement_view()

        return await interaction.edit(embed=self._current_embed, view=self._view, file=self._file)

    def _update_advancement_view(self):
        self._view.remove_item(self._reroll_advancement_button)
        super()._update_advancement_view()

        if self._suitable_adv_count > 1:
            self._view.add_item(self._reroll_advancement_button)

    def _update_trophy_view(self):
        self._view.remove_item(self._reroll_advancement_button)
        super()._update_trophy_view()

    async def cleanup(self):
        self._suitable_adv_count = None
        self._excluded_ids = None
        self._search_params = None
        self._reroll_advancement_button = None
        await super().cleanup()
