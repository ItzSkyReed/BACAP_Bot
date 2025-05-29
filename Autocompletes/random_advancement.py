from typing import Literal

import discord

from Database import DB_Advancement
from common import str_to_bool_or_none


def _format_options(context: discord.AutocompleteContext) -> dict:
    return {
        "title": context.options.get("title"),
        "description": context.options.get("description"),
        "adv_type": context.options.get("adv_type"),
        "tab": context.options.get("tab"),
        "datapack": context.options.get("datapack"),
        "is_hidden": str_to_bool_or_none(context.options.get("is_hidden")),
        "has_exp": str_to_bool_or_none(context.options.get("has_exp")),
        "has_reward": str_to_bool_or_none(context.options.get("has_reward")),
        "has_trophy": str_to_bool_or_none(context.options.get("has_trophy")),
    }


async def _boolean_autocomplete(context: discord.AutocompleteContext, field: Literal['is_hidden', 'exp_count', 'reward_id', 'trophy_id']):
    if all(not value for value in context.options.values()):
        return ["True", "False"]

    return [str(bool(value)) for value in await DB_Advancement.search_bool_attr(attr=field, **_format_options(context))]


async def title_autocomplete(context: discord.AutocompleteContext):
    if all(not value for value in context.options.values()):
        return await DB_Advancement.get_random_titles()

    return await DB_Advancement.search_titles(**_format_options(context))


async def description_autocomplete(context: discord.AutocompleteContext):
    if all(not value for value in context.options.values()):
        return await DB_Advancement.get_random_descriptions()

    descriptions = []
    for description in await DB_Advancement.search_descriptions(**_format_options(context)):
        description = description.split("\n")[0]
        if len(description) >= 100:
            description = f"{description[:96]}..."
        descriptions.append(description)
    return descriptions


async def tab_autocomplete(context: discord.AutocompleteContext):
    if all(not value for value in context.options.values()):
        return await DB_Advancement.get_all_tabs()

    return await DB_Advancement.search_tabs(**_format_options(context))


async def type_autocomplete(context: discord.AutocompleteContext):
    if all(not value for value in context.options.values()):
        return await DB_Advancement.get_all_types()

    return await DB_Advancement.search_types(**_format_options(context))


async def datapack_autocomplete(context: discord.AutocompleteContext):
    if all(not value for value in context.options.values()):
        return await DB_Advancement.get_all_datapacks()

    return await DB_Advancement.search_datapacks(**_format_options(context))


async def hidden_autocomplete(context: discord.AutocompleteContext):
    return await _boolean_autocomplete(context, 'is_hidden')

async def exp_autocomplete(context: discord.AutocompleteContext):
    return await _boolean_autocomplete(context, 'exp_count')


async def reward_autocomplete(context: discord.AutocompleteContext):
    return await _boolean_autocomplete(context, 'reward_id')


async def trophy_autocomplete(context: discord.AutocompleteContext):
    return await _boolean_autocomplete(context, 'trophy_id')
