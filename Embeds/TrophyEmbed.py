from collections.abc import Mapping

import BACAP_Parser
import discord

from Database import DB_Advancement
from common import to_title_style


def format_enchantments(enchantments: Mapping[str, int]) -> str:
    lines = []

    for enchantment_id, level in enchantments.items():
        level_str = f" {BACAP_Parser.arabic_to_rims(level)}" if level != 0 else ""
        lines.append(f"{to_title_style(enchantment_id)}{level_str}")

    return '\n'.join(lines)


class TrophyEmbed(discord.Embed):
    def __init__(self, advancement: DB_Advancement, **kwargs):
        super().__init__(**kwargs)
        self.title = advancement.trophy.name
        self.description = advancement.trophy.description
        self.color = advancement.trophy.color

        if advancement.trophy.icon:
            self.set_thumbnail(url=f"attachment://{advancement.trophy.id}.png")

        self.add_field(name="Item:", value=to_title_style(advancement.trophy.item_id), inline=False)

        if advancement.trophy.unbreakable:
            self.add_field(name="Unbreakable", value="")

        if advancement.trophy.enchantments:
            self.add_field(name="Enchantments:", value=format_enchantments(advancement.trophy.enchantments), inline=False)

        self.add_field(name='Awarded for:', value=advancement.title, inline=False)
