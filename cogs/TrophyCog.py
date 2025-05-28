import discord
from discord.ext import commands

from Database import DB_Trophy
from Controllers.SearchAdvController import SearchAdvController
from Autocompletes import search_trophy
from common import error_embed


class TrophyCog(commands.Cog):
    def __init__(self, bot: commands.Bot):
        self.bot = bot

    @commands.slash_command(
        name="trophy",
        description="Returns trophy by name/desc."
    )
    @discord.option(
        name="name",
        input_type=str,
        required=True,
        description="The name of the trophy.",
        max_length=32,
        autocomplete=search_trophy.name_autocomplete
    )
    async def search_command(self, ctx: discord.ApplicationContext, name: str):
        if not name:
            return error_embed(title="Name or description is required!", description="You need to provide name of the trophy.")

        trophy = await DB_Trophy.search_with_relations(name, 1)

        if not trophy:
            return error_embed(title="Trophy not found!", description="Trophies with such name or description are not found.")

        else:
            return await SearchAdvController(trophy[0].advancement).send_trophy_view(ctx)


def setup(bot: commands.Bot):
    bot.add_cog(TrophyCog(bot))
