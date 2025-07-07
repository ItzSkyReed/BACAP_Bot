import discord
from discord.ext import commands
from pycord.multicog import subcommand, Bot

from Database import DB_Trophy
from Controllers import SearchController, RandomTrophyController
from Autocompletes import search_trophy, random_trophy
from common import error_embed, str_to_bool_or_none


class TrophyCog(commands.Cog):
    def __init__(self, bot: Bot):
        self.bot = bot

    @subcommand("random")
    @commands.slash_command(
        name="trophy",
        description="Returns random trophy that matches the parameters"
    )
    @discord.option(
        name="name",
        input_type=str,
        required=False,
        description="The name of the trophy.",
        max_length=32,
        autocomplete=random_trophy.name_autocomplete
    )
    @discord.option(
        name="description",
        input_type=str,
        required=False,
        description="The description of the trophy.",
        max_length=100,
        autocomplete=random_trophy.description_autocomplete
    )
    @discord.option(
        name="is_unbreakable",
        input_type=str,
        required=False,
        description="Is Trophy unbreakable?",
        max_length=32,
        autocomplete=random_trophy.unbreakable_autocomplete
    )
    @discord.option(
        name="has_enchantments",
        input_type=str,
        required=False,
        description="Does trophy have enchantments?",
        max_length=32,
        autocomplete=random_trophy.enchantments_autocomplete
    )
    async def random_command(self, ctx: discord.ApplicationContext, name: str, description: str, is_unbreakable: str, has_enchantments: str):
        is_unbreakable = str_to_bool_or_none(is_unbreakable)
        has_enchantments = str_to_bool_or_none(has_enchantments)

        if description and len(description) >= 99:
            description = description[:96]

        trophy = await DB_Trophy.search_with_relations(name=name, description=description, is_unbreakable=is_unbreakable, has_enchantments=has_enchantments, limit=1, randomize=True)

        if not trophy:
            return error_embed(title="Trophy not found!", description="Trophies with such parameters are not found.")

        search_params = {"name": name, "description": description, "has_enchantments": has_enchantments, "is_unbreakable": is_unbreakable}

        suitable_trophy_count = await DB_Trophy.get_filtered_count(**search_params)

        if suitable_trophy_count == 1:
            return await SearchController(trophy[0].advancement).send_trophy_view(ctx)

        return await RandomTrophyController(trophy[0], suitable_trophy_count, **search_params).send_trophy_view(ctx)


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

        trophy = await DB_Trophy.search_with_relations(name=name, limit=1)

        if not trophy:
            return error_embed(title="Trophy not found!", description="Trophies with such name or description are not found.")

        else:
            return await SearchController(trophy[0].advancement).send_trophy_view(ctx)

def setup(bot: Bot):
    bot.add_cog(TrophyCog(bot))
