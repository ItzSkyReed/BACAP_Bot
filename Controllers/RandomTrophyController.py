import discord

from Buttons import RerollTrophyButton
from Controllers.SearchController import SearchController
from Database import DB_Advancement, DB_Trophy
from common import error_embed


class RandomTrophyController(SearchController):
    def __init__(self, trophy: DB_Trophy, suitable_trophy_count: int, search_params: dict[str, str]):
        super().__init__(trophy.advancement)

        self._suitable_trophy_count = suitable_trophy_count
        self._excluded_ids: list[int] | None = [trophy.id]
        self._search_params = search_params
        self._reroll_trophy_button = RerollTrophyButton(callback=self.on_reroll_button_click)

    def __clear_reroll_info(self):
        self._view.remove_item(self._reroll_trophy_button)
        self._reroll_trophy_button = None
        self._suitable_trophy_count = 0
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

        trophy = (await DB_Trophy.search_with_relations(**self._search_params, limit=1, randomize=True, excluded_ids=self._excluded_ids))[0]
        self._advancement: DB_Advancement = trophy.advancement

        self._excluded_ids.append(trophy.id)
        self._suitable_trophy_count -= 1

        self._update_trophy_view()

        return await interaction.edit(embed=self._current_embed, view=self._view, file=self._file)

    def _update_advancement_view(self):
        self._view.remove_item(self._reroll_trophy_button)
        super()._update_advancement_view()

    def _update_trophy_view(self):
        self._view.remove_item(self._reroll_trophy_button)
        super()._update_advancement_view()

        if self._suitable_trophy_count > 1:
            self._view.add_item(self._reroll_trophy_button)

    async def cleanup(self):
        self._suitable_trophy_count = None
        self._excluded_ids = None
        self._search_params = None
        self._reroll_trophy_button = None
        await super().cleanup()
