from typing import Literal

import discord
from discord.ext import commands

from src.Database import DB_Trophy
from src.Messages.AdvancementTrophyViewController import AdvancementTrophyViewController
from src.common import error_embed


async def name_autocomplete(context: discord.AutocompleteContext):
    return await trophy_autocomplete(context, strings_to_return='name')


async def description_autocomplete(context: discord.AutocompleteContext):
    descriptions = []
    for description in await trophy_autocomplete(context, strings_to_return='description'):
        if len(description) > 100:
            description = f"{description[:97]}..."

        descriptions.append(description.replace("\n", "; "))

    return descriptions

async def trophy_autocomplete(context: discord.AutocompleteContext, strings_to_return: Literal['name', 'description']):
    trophy = await DB_Trophy.search_without_relations(context.options['name'], context.options['description'])
    if not trophy:
        return []
    return [getattr(trophy_inst, strings_to_return) for trophy_inst in trophy]

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
        autocomplete=name_autocomplete
    )
    @discord.option(
        name="description",
        input_type=str,
        required=False,
        description="The description of the trophy.",
        max_length=100,
        autocomplete=description_autocomplete
    )
    async def search_command(self, ctx: discord.ApplicationContext, name: str, description: str):
        if not name and not description:
            return error_embed(title="Name or description is required!", description="You need to provide name or description of the trophy.")

        if description and len(description) >= 100:
            description = description[:97]

        trophy = await DB_Trophy.search_with_relations(name, description, 1)

        if not trophy:
            return error_embed(title="Trophy not found!", description="Trophies with such name or description are not found.")

        else:
            return await AdvancementTrophyViewController(trophy[0].advancement).send_trophy_view(ctx)


def setup(bot: commands.Bot):
    bot.add_cog(TrophyCog(bot))
