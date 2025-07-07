import discord
import bisect
from Database import DB_Advancement
from common import format_float, to_title_style, format_time
from constants import EXP_EMOJIS


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
            # noinspection PyTypeChecker
            self.add_field(name='Parent', value=advancement.parent.title)

        self.add_field(name='Hidden?', value="Yes" if advancement.is_hidden else "No")

        if advancement.exp_count:
            self.add_field(name='Experience', value=f"{advancement.exp_count} {self._get_exp_emoji(advancement.exp_count)}")

        if advancement.is_addon:
            self.add_field(name='Addon', value=advancement.datapack)

        if advancement.reward_id:
            # noinspection PyTypeChecker
            self.add_field(name='Reward', value=f"{to_title_style(advancement.reward.item_id)}: {advancement.reward.amount}")

        if advancement.trophy_id:
            # noinspection PyTypeChecker
            self.add_field(name='Trophy', value=advancement.trophy.name)

        if advancement.actual_requirements:
            self._add_actual_requirements(advancement.actual_requirements)

        if advancement.wb_addon_id:
            addon = advancement.wb_addon

            lines = [f"{'':>6}{'Blocks':>10}{'Expand time':>13}"]

            if addon.bacap_blocks or addon.bacap_seconds:
                # noinspection PyTypeChecker
                bacap_blocks = format_float(addon.bacap_blocks)
                # noinspection PyTypeChecker
                bacap_seconds = format_float(addon.bacap_seconds)
                lines.append(f"{'BACAP:':>6}{bacap_blocks:>10}{format_time(bacap_seconds):>13}")

            if addon.ed_blocks or addon.ed_seconds:
                # noinspection PyTypeChecker
                ed_blocks = format_float(addon.ed_blocks)
                # noinspection PyTypeChecker
                ed_seconds = format_float(addon.ed_seconds)
                lines.append(f"{'ED:':>6}{ed_blocks:>10}{format_time(ed_seconds):>13}")

            self.add_field(
                name="WB Addon Info:",
                value="```\n" + "\n".join(lines) + "\n```",
                inline=False
            )

    def _add_actual_requirements(self, string: str) -> None:
        if len(string) <= 1024:
            self.add_field(name='Actual Requirements:', value=string, inline=False)
            return

        actual_req_list = [string[i:i + 1024] for i in range(0, len(string), 1024)]
        for i, req in enumerate(actual_req_list):
            self.add_field(name='Actual Requirements:' if i == 0 else '', value=req, inline=False)

    @staticmethod
    def _get_exp_emoji(exp_count: int) -> str:
        thresholds = [2, 6, 16, 36, 72, 148, 306, 616, 1236, 2476, float("inf")]

        index = bisect.bisect_right(thresholds, exp_count)
        return EXP_EMOJIS[index]

    def _add_alt_descriptions(self, advancement: DB_Advancement):
        alt_desc = advancement.alt_descriptions
        if not advancement.alt_descriptions_id or not alt_desc:
            return
        # noinspection PyTypeChecker
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
