import discord

from Database import DB_Advancement
from common import format_float, to_title_style, format_time


class AdvancementEmbed(discord.Embed):
    def __init__(self, advancement: DB_Advancement, **kwargs):
        super().__init__(**kwargs)
        self.title = advancement.title
        self.description = advancement.description
        self.color = advancement.color

        if advancement.icon:
            self.set_thumbnail(url=f"attachment://{advancement.id}.png")

        self._add_alt_descriptions(advancement)

        self.add_field(name='Tab', value=advancement.tab)

        if advancement.parent_id:
            self.add_field(name='Parent', value=advancement.parent.title)

        self.add_field(name='Hidden?', value="Yes" if advancement.is_hidden else "No")

        if advancement.exp_count:
            self.add_field(name='Experience', value=str(advancement.exp_count))

        if advancement.is_addon:
            self.add_field(name='Addon', value=advancement.datapack)

        if advancement.reward_id:
            self.add_field(name='Reward', value=f"{advancement.reward.item_id.replace("_", " ").title()}: {advancement.reward.amount}")

        if advancement.trophy_id:
            self.add_field(name='Trophy', value=advancement.trophy.name)

        if advancement.wb_addon_id:
            addon = advancement.wb_addon

            lines = [f"{'':>6}{'Blocks':>10}{'Expand time':>13}"]

            if addon.bacap_blocks or addon.bacap_seconds:
                bacap_blocks = format_float(addon.bacap_blocks)
                bacap_seconds = format_float(addon.bacap_seconds)
                lines.append(f"{'BACAP:':>6}{bacap_blocks:>10}{format_time(bacap_seconds):>13}")

            if addon.ed_blocks or addon.ed_seconds:
                ed_blocks = format_float(addon.ed_blocks)
                ed_seconds = format_float(addon.ed_seconds)
                lines.append(f"{'ED:':>6}{ed_blocks:>10}{format_time(ed_seconds):>13}")

            self.add_field(
                name="WB Addon Info:",
                value="```\n" + "\n".join(lines) + "\n```",
                inline=False
            )

    def _add_alt_descriptions(self, advancement: DB_Advancement):
        alt_desc = advancement.alt_descriptions
        if not advancement.alt_descriptions_id or not alt_desc:
            return

        for column in alt_desc.__table__.columns:
            if column.name == "id":
                continue

            value = getattr(alt_desc, column.name)
            if value:
                self.add_field(
                    name=f"{to_title_style(column.name)} description:",
                    value=value,
                    inline=False
                )
