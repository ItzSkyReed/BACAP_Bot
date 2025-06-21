from pathlib import Path

from BACAP_Parser import cut_namespace, Advancement

from DBGenerator.constants import ASSETS_FOLDER

WB_ADDON_BACAP_PATH = ASSETS_FOLDER / r"wb_addon/data/bc_wb/function/rewards/bacap/vanilla/normal"
WB_ADDON_BACAPED_PATH = ASSETS_FOLDER /  r"wb_addon/data/bc_wb/function/rewards/bacaped/vanilla/normal"

def __read_reward(path: Path) -> tuple[float | None, int | None]:
    file_text = path.read_text(encoding="utf-8").splitlines()[0].split() # We read text, split it to separate lines, then take first line, split it to different "words"
    try:
        return float(file_text[-2]), int(file_text[-1]) # We took "last word", it is seconds, and "last word-1", it is blocks
    except ValueError: # TODO better regex solution
        return None, None

def get_blocks_seconds(adv: Advancement) -> dict[str, tuple[float, int]]:
    adv_wb_bacap_path = WB_ADDON_BACAP_PATH / f"{cut_namespace(adv.mc_path)}.mcfunction"
    adv_wb_ed_path = WB_ADDON_BACAPED_PATH / f"{cut_namespace(adv.mc_path)}.mcfunction"

    data = {}

    if adv_wb_bacap_path.exists():
        data["BACAP"] = __read_reward(adv_wb_bacap_path)

    if adv_wb_ed_path.exists():
        data["ED"] = __read_reward(adv_wb_ed_path)

    return data
