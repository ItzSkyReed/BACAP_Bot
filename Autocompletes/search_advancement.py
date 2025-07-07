import discord

from Database import DB_Advancement

__all__ = ['title_autocomplete']

async def title_autocomplete(context: discord.AutocompleteContext):
    if not context.options["title"]:
        return await DB_Advancement.get_random_titles()

    return await DB_Advancement.search_titles(title=context.options["title"])
