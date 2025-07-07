import discord
from discord.ext import commands

from Autocompletes import random_advancement, search_advancement
from Database import DB_Advancement
from Controllers import SearchController, RandomAdvController
from common import error_embed, str_to_bool_or_none


class AdvancementCog(commands.Cog):
    random_group = discord.SlashCommandGroup(name='random')

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
        autocomplete=search_advancement.title_autocomplete
    )
    async def search_command(self, ctx: discord.ApplicationContext, title: str):
        adv = await DB_Advancement.search_with_relations(title=title, limit=1)

        if not adv:
            return await ctx.respond(embed=error_embed(title="Advancement not found!", description="Advancements with such title are not found."), ephemeral=True)

        return await SearchController(adv[0]).send_advancement_view(ctx)

    @random_group.command(
        name="advancement",
        description="Returns random advancement that matches the parameters"
    )
    @discord.option(
        name="title",
        input_type=str,
        required=False,
        description="The title of the advancement.",
        max_length=32,
        autocomplete=random_advancement.title_autocomplete
    )
    @discord.option(
        name="description",
        input_type=str,
        required=False,
        description="The description of the advancement.",
        max_length=100,
        autocomplete=random_advancement.description_autocomplete
    )
    @discord.option(
        name="type",
        input_type=str,
        required=False,
        description="The type of the advancement.",
        max_length=32,
        autocomplete=random_advancement.type_autocomplete,
        parameter_name="adv_type"
    )
    @discord.option(
        name="tab",
        input_type=str,
        required=False,
        description="The tab of the advancement.",
        max_length=32,
        autocomplete=random_advancement.tab_autocomplete
    )
    @discord.option(
        name="datapack",
        input_type=str,
        required=False,
        description="The datapack of the advancement.",
        max_length=32,
        autocomplete=random_advancement.datapack_autocomplete
    )
    @discord.option(
        name="is_hidden",
        input_type=str,
        required=False,
        description="Is advancement hidden?",
        max_length=32,
        autocomplete=random_advancement.hidden_autocomplete
    )
    @discord.option(
        name="has_exp",
        input_type=str,
        required=False,
        description="Does the advancement have an experience reward?",
        max_length=32,
        autocomplete=random_advancement.exp_autocomplete
    )
    @discord.option(
        name="has_reward",
        input_type=str,
        required=False,
        description="Does the advancement have an item reward?",
        max_length=32,
        autocomplete=random_advancement.reward_autocomplete
    )
    @discord.option(
        name="has_trophy",
        input_type=str,
        required=False,
        description="Does the advancement have a trophy reward?",
        max_length=32,
        autocomplete=random_advancement.trophy_autocomplete
    )
    async def random_command(self, ctx: discord.ApplicationContext, title: str, description: str, adv_type: str,
                             tab: str, datapack: str, is_hidden: str, has_exp: str, has_reward: str, has_trophy: str):

        is_hidden = str_to_bool_or_none(is_hidden)
        has_exp = str_to_bool_or_none(has_exp)
        has_reward = str_to_bool_or_none(has_reward)
        has_trophy = str_to_bool_or_none(has_trophy)

        if description and len(description) >= 99:
            description = description[:96]

        search_params = {"title": title, "description": description, "adv_type": adv_type, "tab": tab, "datapack": datapack,
                         "is_hidden": is_hidden, "has_exp": has_exp, "has_reward": has_reward, "has_trophy": has_trophy}

        adv = await DB_Advancement.search_with_relations(**search_params, limit=1, randomize=True)

        if not adv:
            return await ctx.respond(embed=error_embed(title="Advancement not found!", description="Advancements with such parameters are not found."), ephemeral=True)

        suitable_adv_count = await DB_Advancement.get_filtered_count(**search_params)

        if suitable_adv_count == 1:
            return await SearchController(adv[0]).send_advancement_view(ctx)

        return await RandomAdvController(adv[0], suitable_adv_count, search_params).send_advancement_view(ctx)



def setup(bot: commands.Bot):
    bot.add_cog(AdvancementCog(bot))
