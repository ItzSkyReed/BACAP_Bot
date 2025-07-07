from typing import Literal, Any, Coroutine

import discord

from Database import DB_Advancement, DB_Trophy
from common import str_to_bool_or_none

__all__ = ['name_autocomplete', 'description_autocomplete', 'unbreakable_autocomplete', 'enchantments_autocomplete']

def _format_options(context: discord.AutocompleteContext) -> dict:
    return {
        "name": context.options.get("name"),
        "description": context.options.get("description"),
        "is_unbreakable": str_to_bool_or_none(context.options.get("is_unbreakable")),
        "has_enchantments": str_to_bool_or_none(context.options.get("has_enchantments")),
    }

def _format_description(description: str) -> str:
    description = description.replace("\n", " ")
    if len(description) >= 100:
        description = f"{description[:96]}..."
    return description

async def _boolean_autocomplete(context: discord.AutocompleteContext, field: Literal['unbreakable', 'enchantments']) -> list[str]:
    if all(not value for value in context.options.values()):
        return ["True", "False"]

    return [str(bool(value)) for value in await DB_Trophy.search_bool_attr(attr=field, **_format_options(context))]


async def name_autocomplete(context: discord.AutocompleteContext):
    if all(not value for value in context.options.values()):
        return await DB_Trophy.get_random_names()

    return await DB_Trophy.search_names(**_format_options(context))


async def description_autocomplete(context: discord.AutocompleteContext):
    if all(not value for value in context.options.values()):
        return [_format_description(description) for description in await DB_Trophy.get_random_descriptions()]

    return [_format_description(description) for description in await DB_Trophy.search_descriptions(**_format_options(context))]

async def unbreakable_autocomplete(context: discord.AutocompleteContext):
    return await _boolean_autocomplete(context, 'unbreakable')


async def enchantments_autocomplete(context: discord.AutocompleteContext):
    return await _boolean_autocomplete(context, 'enchantments')
