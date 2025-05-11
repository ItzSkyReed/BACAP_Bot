from typing import Literal

import discord
from discord.ext import commands

from Database import DB_Advancement
from Messages.AdvancementTrophyViewController import AdvancementTrophyViewController
from common import error_embed


async def title_autocomplete(context: discord.AutocompleteContext):
    return await adv_autocomplete(context, strings_to_return='title')


async def description_autocomplete(context: discord.AutocompleteContext):
    descriptions = []
    for description in await adv_autocomplete(context, strings_to_return='description'):
        if len(description) > 100:
            description = f"{description[:97]}..."

        descriptions.append(description.replace("\n", "; "))

    return descriptions

async def adv_autocomplete(context: discord.AutocompleteContext, strings_to_return: Literal['title', 'description']):
    if not context.options['title'] and not context.options['description']:
        advancements = await DB_Advancement.get_random_advancements()
    else:
        advancements = await DB_Advancement.search_without_relations(context.options['title'], context.options['description'])
    if not advancements:
        return []
    return [getattr(adv_inst, strings_to_return) for adv_inst in advancements]

class AdvancementCog(commands.Cog):
    def __init__(self, bot: commands.Bot):
        self.bot = bot

    @commands.slash_command(
        name="advancement",
        description="Returns advancement by name/desc."
    )
    @discord.option(
        name="title",
        input_type=str,
        required=True,
        description="The title of the advancement.",
        max_length=32,
        autocomplete=title_autocomplete
    )
    @discord.option(
        name="description",
        input_type=str,
        required=False,
        description="The description of the advancement.",
        max_length=100,
        autocomplete=description_autocomplete
    )
    async def search_command(self, ctx: discord.ApplicationContext, title: str, description: str):
        if not title and not description:
            return error_embed(title="Title or description is required!", description="You need to provide title or description of the advancement.")

        if description and len(description) >= 100:
            description = description[:97]

        adv = await DB_Advancement.search_with_relations(title, description, 1)

        if not adv:
            return error_embed(title="Advancement not found!", description="Advancements with such title or description are not found.")

        else:
            return await AdvancementTrophyViewController(adv[0]).send_advancement_view(ctx)


def setup(bot: commands.Bot):
    bot.add_cog(AdvancementCog(bot))
