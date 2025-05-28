import discord

from Database import DB_Trophy


async def name_autocomplete(context: discord.AutocompleteContext):
    if not context.options["name"]:
        return await DB_Trophy.get_random_names()
    return await DB_Trophy.search_names(context.options["name"])
