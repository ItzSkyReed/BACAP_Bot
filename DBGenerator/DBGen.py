import asyncio
from pathlib import Path

import BACAP_Parser
from BACAP_Parser import Parser, Datapack, AdvTypeManager, AdvType, Color, constants, TechnicalAdvancement, cut_namespace, DEFAULT_BACAP_HIDDEN_COLOR

import Database
from DBGenerator.ActualRequirementsParser import EDActualRequirementsParser, BACAPActualRequirementsParser
from DBGenerator.constants import ASSETS_FOLDER, ENCHANTMENTS_WITH_ONE_LEVEL
from Database import DB_Advancement, DB_AdvancementAltDescriptions, DB_WB_Addon
from DBGenerator import IconGenerator, WBAddonParser


def __load_parser():
    task = AdvType(name="task", frames="task", colors=Color("green"))
    goal = AdvType(name="goal", frames="goal", colors=Color("#75E1FF"))
    challenge = AdvType(name="challenge", frames="challenge", colors=Color("dark_purple"), hidden_color=DEFAULT_BACAP_HIDDEN_COLOR)
    super_challenge = AdvType(name="super_challenge", frames="challenge", colors=Color("#FF2A2A"), tabs="challenges", hidden_color=DEFAULT_BACAP_HIDDEN_COLOR)
    root = AdvType(name="root", frames=("task", "challenge"), colors=Color("#CCCCCC"))
    milestone = AdvType(name="milestone", frames="goal", colors=Color("yellow"), tabs="bacap")
    advancement_legend = AdvType(name="advancement_legend", frames="challenge", colors=Color("gold"), tabs="bacap")

    task_terralith = AdvType(name="task", frames="task", colors=Color("green"), hidden_color=DEFAULT_BACAP_HIDDEN_COLOR)
    challenge_terralith = AdvType(name="challenge", frames="challenge", colors=[Color("dark_purple"), Color("#00AA00")], hidden_color=DEFAULT_BACAP_HIDDEN_COLOR)

    manager = AdvTypeManager(task, goal, challenge, super_challenge, root, milestone, advancement_legend)
    terralith_manager = AdvTypeManager(task_terralith, goal, challenge_terralith, super_challenge, root, milestone, advancement_legend)

    bacap = Datapack(name="bacap", path=Path(ASSETS_FOLDER / r"datapacks/bacap"), adv_type_manager=manager, reward_namespace="bacap_rewards", technical_tabs="technical")
    bacaped = Datapack(name="bacaped", path=Path(ASSETS_FOLDER / "datapacks/bacaped"), adv_type_manager=manager, reward_namespace="bacaped_rewards", technical_tabs="technical")

    bacap_hardcore = Datapack(name="bacap_hardcore", path=Path(ASSETS_FOLDER / r"datapacks/bacap_hardcore"), adv_type_manager=manager, technical_tabs="technical")
    bacap_terralith = Datapack(name="bacap_terralith", path=Path(ASSETS_FOLDER / r"datapacks/bacap_terralith"), adv_type_manager=terralith_manager, technical_tabs="technical")
    bacap_nullscapes = Datapack(name="bacap_nullscapes", path=Path(ASSETS_FOLDER / r"datapacks/bacap_nullscapes"), adv_type_manager=manager, technical_tabs="technical")
    bacap_amplified_nether = Datapack(name="bacap_amplified_nether", path=Path(ASSETS_FOLDER / r"datapacks/bacap_amplified_nether"), adv_type_manager=manager, technical_tabs="technical")

    bacaped_hardcore = Datapack(name="bacaped_hardcore", path=Path(ASSETS_FOLDER / "datapacks/bacaped_hardcore"), adv_type_manager=manager, reward_namespace="bacaped_rewards",
                                technical_tabs="technical")

    return Parser(bacap, bacaped), {"hardcore": [bacap_hardcore, bacaped_hardcore], "terralith": [bacap_terralith], "nullscapes": [bacap_nullscapes], "amplified_nether": [bacap_amplified_nether]}


NORMAL_PACKS, COMP_ADDONS = __load_parser()
ED_Reqs = EDActualRequirementsParser()
BACAP_Reqs = BACAPActualRequirementsParser()


def __run_async_sync(awaitable):
    try:
        loop = asyncio.get_running_loop()
    except RuntimeError:
        loop = asyncio.new_event_loop()
        asyncio.set_event_loop(loop)
    if loop.is_running():
        future = asyncio.run_coroutine_threadsafe(awaitable, loop)
        return future.result()
    else:
        return loop.run_until_complete(awaitable)


def _is_advancement_in_database(advancement_mc_path: str) -> bool:
    return bool(__run_async_sync(Database.DB_Advancement.get_adv_by_mc_path(advancement_mc_path)))


def _get_advancement_id_by_mc_path(advancement_mc_path: str) -> int | None:
    adv = __run_async_sync(Database.DB_Advancement.get_adv_by_mc_path(advancement_mc_path))
    if adv:
        return adv.id
    else:
        return None


def __save_advancement_sync(advancement: Database.DB_Advancement) -> Database.DB_Advancement:
    return __run_async_sync(advancement.save())


def __save_trophy_sync(trophy: Database.DB_Trophy) -> Database.DB_Trophy:
    return __run_async_sync(trophy.save())


def __save_reward_sync(reward: Database.DB_Reward) -> Database.DB_Reward:
    return __run_async_sync(reward.save())


def __save_wb_sync(wb: Database.DB_WB_Addon) -> Database.DB_WB_Addon:
    return __run_async_sync(wb.save())


def _find_advancement_by_mc_path(mc_path: str, datapack: BACAP_Parser.Datapack | None = None) -> tuple | None:
    # Only in provided datapack first datapack
    if datapack:
        results = datapack.advancement_manager.find({"mc_path": mc_path}, skip_technical=False, limit=1)
        if results:
            return results[0], datapack.name

    # Global search
    for dp in NORMAL_PACKS.datapacks:
        results = dp.advancement_manager.find({"mc_path": mc_path}, skip_technical=False, limit=1)
        if results:
            return results[0], dp.name

    return None

def __format_enchantments(obj: dict[str, int]):
    enchantments = {}

    for key, value in obj.items():
        value = value if value not in ENCHANTMENTS_WITH_ONE_LEVEL else 0
        enchantments[cut_namespace(key)] = value

    return enchantments


def _load_adv_with_rewards(adv: BACAP_Parser.Advancement, datapack_name: str, parent_id: int | None = 0):
    trophy_id = None
    if adv.trophy:

        trophy_enchantments = adv.trophy.item.components.get("enchantments")
        if trophy_enchantments:
            trophy_enchantments = __format_enchantments(trophy_enchantments)

        trophy_icon = IconGenerator.get_trophy_icon(adv.trophy.item)
        unbreakable = True if adv.trophy.item.components.get("unbreakable") else False

        trophy_id = __save_trophy_sync(
            Database.DB_Trophy(
                name=adv.trophy.item.name,
                description=adv.trophy.item.description,
                color=adv.trophy.item.color.as_int,
                item_id=cut_namespace(adv.trophy.item.id),
                icon=trophy_icon,
                enchantments=trophy_enchantments,
                unbreakable=unbreakable
            )
        ).id

    reward_id = None
    if adv.reward:
        reward_id = __save_reward_sync(
            Database.DB_Reward(
                item_id=cut_namespace(adv.reward.item.id),
                amount=adv.reward.item.amount,
            )
        ).id

    wb_data = WBAddonParser.get_blocks_seconds(adv)
    wb_db_id = None
    if wb_data:
        wb_db = DB_WB_Addon()

        if wb_data.get("BACAP"):
            wb_db.bacap_blocks = wb_data["BACAP"][0]
            wb_db.bacap_seconds = wb_data["BACAP"][1]

        if wb_data.get("ED"):
            wb_db.ed_blocks = wb_data["ED"][0]
            wb_db.ed_seconds = wb_data["ED"][1]
        wb_db_id = __save_wb_sync(wb_db).id


    if 'bacaped' in datapack_name.lower():
        actual_reqs = ED_Reqs.get(adv.title)
    elif 'bacap' in datapack_name.lower():
        actual_reqs = BACAP_Reqs.get(datapack_name=datapack_name, tab_display=adv.tab_display, title=adv.title)
    else:
        actual_reqs = None


    __save_advancement_sync(
        DB_Advancement(
            title=adv.title,
            description=adv.description,
            actual_requirements=actual_reqs,
            mc_path=adv.mc_path,
            icon=IconGenerator.get_adv_icon(adv.icon, adv.frame),
            type=adv.type.name.replace('_', ' ').title(),
            tab=adv.tab_display,
            color=adv.color.as_int,
            frame=adv.frame.replace('_', ' ').title(),
            is_hidden=adv.hidden,
            datapack=datapack_name.replace('_', ' ').title(),
            is_addon=datapack_name != "bacap",
            parent_id=parent_id,
            exp_count=adv.exp.value if adv.exp else None,
            trophy_id=trophy_id,
            reward_id=reward_id,
            wb_addon_id=wb_db_id
        ))


def _find_first_non_technical_parent(adv: BACAP_Parser.TechnicalAdvancement | BACAP_Parser.Advancement, datapack: Datapack | None = None) -> BACAP_Parser.Advancement | None:
    """
    Traverses up the parent chain until it finds an advancement
    that is NOT a TechnicalAdvancement.
    Returns the found advancement, or None if none was found.
    """
    current = adv

    while current.parent:
        result = _find_advancement_by_mc_path(current.parent, datapack)
        if not result:
            print(f"Parent {current.parent} not found")
            return None

        parent_adv, _ = result

        if not isinstance(parent_adv, TechnicalAdvancement):
            return parent_adv

        current = parent_adv

    # No parent — return None
    return None


def _resolve_and_save_parents(
        advancement: BACAP_Parser.Advancement,
        datapack: BACAP_Parser.Datapack | None = None
) -> int | None:
    if isinstance(advancement, TechnicalAdvancement):
        advancement = _find_first_non_technical_parent(advancement)
        if advancement is None:
            return None

    if advancement.is_root:
        return None

    # Find the closest non-technical parent
    parent_adv = _find_first_non_technical_parent(advancement, datapack)
    if parent_adv is None:
        return None
    parent_mc_path = parent_adv.mc_path

    # Check if parent is already saved
    existing_id = _get_advancement_id_by_mc_path(parent_mc_path)
    if existing_id:
        return existing_id

    # Try to find the parent in the provided datapack or globally
    found = _find_advancement_by_mc_path(parent_mc_path, datapack)
    if not found:
        print(f"Parent {parent_mc_path} not found in datapack or global search")
        return None

    parent_adv, datapack_name = found

    # Recursively resolve and save parent’s parent
    grand_parent_id = _resolve_and_save_parents(parent_adv, datapack)

    # Save this parent
    _load_adv_with_rewards(parent_adv, datapack_name, parent_id=grand_parent_id)

    return _get_advancement_id_by_mc_path(parent_mc_path)


def _save_advancement_with_parents(adv: BACAP_Parser.Advancement, datapack_name: str, datapack: BACAP_Parser.Datapack | None = None):
    _load_adv_with_rewards(adv, datapack_name, parent_id=_resolve_and_save_parents(adv, datapack))


def _save_alt_description_field(alt_desc_id: int, description: str, field_name: str) -> int:
    """
    Saves or updates a specific field in the alternative description model.

    Args:
        alt_desc_id (int): ID of the alternative description entry.
        description (str): New description value.
        field_name (str): Field name to set (e.g. 'mod', 'datapack').

    Returns:
        int: ID of the saved alternative description entry.
    """
    alt_desc = DB_AdvancementAltDescriptions(id=alt_desc_id)
    setattr(alt_desc, field_name, description)
    return __run_async_sync(alt_desc.save()).id


def _process_existing_advancement(
        adv: BACAP_Parser.Advancement, normal_adv: "DB_Advancement", comp_addon_type: str
):
    """
    Updates the original advancement with an alternate description if it differs.

    Args:
        adv (AddonAdvancement): Advancement from the addon.
        normal_adv (DB_Advancement): Original registered advancement.
        comp_addon_type (str): Source type ('mod', 'datapack', etc.).
    """
    if adv.description != normal_adv.description and normal_adv.alt_descriptions_id is None:
        # Save new alternative description for this advancement
        alt_desc_id = _save_alt_description_field(
            normal_adv.alt_descriptions_id,
            adv.description,
            field_name=comp_addon_type
        )

        # Link updated alt description and save advancement
        normal_adv.alt_descriptions_id = alt_desc_id
        __run_async_sync(normal_adv.save())


def _process_addon_advancement(adv: BACAP_Parser.Advancement, datapack: BACAP_Parser.Datapack, comp_addon_type: str):
    normal_adv = __run_async_sync(DB_Advancement.get_adv_by_mc_path(adv.mc_path))

    if normal_adv:
        _process_existing_advancement(adv, normal_adv, comp_addon_type)
    else:
        _save_advancement_with_parents(adv, datapack.name, datapack)


def _process_addon(datapack, comp_addon_type: str):
    for adv in datapack.advancement_manager.filtered_iterator():
        _process_addon_advancement(adv, datapack, comp_addon_type)

def load_normal():
    for datapack_name, datapack in NORMAL_PACKS.datapacks_dict.items():
        for adv in datapack.advancement_manager.filtered_iterator():
            if _is_advancement_in_database(adv.mc_path):
                continue

            _save_advancement_with_parents(adv, datapack_name)

def load_comp_addon():
    for comp_addon_type, addons in COMP_ADDONS.items():
        for addon in addons:
            _process_addon(addon, comp_addon_type)
