from pathlib import Path

__all__ = ["ASSETS_FOLDER", "CACHE_FOLDER", "ENCHANTMENTS_WITH_ONE_LEVEL", "ED_GH_PAGES_URL", "BAC_DOC_SHEET_PATH", "BACAPED_DATAPACK_NAME", "BACAPED_HARDCORE_DATAPACK_NAME",
           "BACAP_HARDCORE_DATAPACK_NAME", "BACAP_DATAPACK_NAME", "BACAP_NULLSCAPE_DATAPACK_NAME", "BACAP_AMPLIFIED_NETHER_DATAPACK_NAME", "BACAP_TERRALITH_DATAPACK_NAME",
           "CEREAL_DEDICATION_DATAPACK_NAME", "COMPLETE_COLLECTION_DATAPACK_NAME", "CEREAL_DEDICATION_HARDCORE_DATAPACK_NAME"]

ASSETS_FOLDER = Path(__file__).parent.parent / "assets"

CACHE_FOLDER = ASSETS_FOLDER / "cache"

ENCHANTMENTS_WITH_ONE_LEVEL = ["aqua_affinity", "curse_of_binding", "channeling", "silk_touch", "curse_of_vanishing", "infinity", "mending", "flame", "multishot"]

ED_GH_PAGES_URL = r"https://raw.githubusercontent.com/Komaru-cats/BACAP-Enhanced-Discoveries/refs/heads/pages"

BAC_DOC_SHEET_PATH = ASSETS_FOLDER / "misc/BAC_SHEET.xlsx"

RIDDLE_ME_THIS_ACTUAL_REQ = ["Put Curse of Vanishing on a compass",
                             "Slay either a Drowned with a fishing rod or a Zombie Villager of fisherman profession",
                             "Ride a mob named “Dinnerbone” or “Grumm” for 1km",
                             "Put either a Flower Pot or Decorated Pot inside a Decorated Pot, and place either a Flower Pot or Decorated Pot one block above a Decorated Pot",
                             "Have the Invisibility and Glowing effects at the same time",
                             "Throw an egg at a chicken that is currently in mid-air",
                             "Give a baby Piglin a gold ingot",
                             "Kill a Wither with a splash healing potion",
                             "Use a spyglass while you have a parrot on your shoulder, a map in your other hand, and are riding a boat",
                             "Place 1000 Warped Buttons (note: It does not start counting until you have completed the ninth line)"
                             ]

BACAPED_DATAPACK_NAME = "Enhanced Discoveries"
BACAPED_HARDCORE_DATAPACK_NAME = f"{BACAPED_DATAPACK_NAME} Hardcore"

BACAP_DATAPACK_NAME = "BlazeAndCave's"
BACAP_TERRALITH_DATAPACK_NAME = f"{BACAP_DATAPACK_NAME} Terralith"
BACAP_NULLSCAPE_DATAPACK_NAME = f"{BACAP_DATAPACK_NAME} Nullscape"
BACAP_HARDCORE_DATAPACK_NAME = f"{BACAP_DATAPACK_NAME} Hardcore"
BACAP_AMPLIFIED_NETHER_DATAPACK_NAME = f"{BACAP_DATAPACK_NAME} Amplified Nether"

COMPLETE_COLLECTION_DATAPACK_NAME = "Complete Collection"

CEREAL_DEDICATION_DATAPACK_NAME = "Cereal Dedication"
CEREAL_DEDICATION_HARDCORE_DATAPACK_NAME = f"{CEREAL_DEDICATION_DATAPACK_NAME} Hardcore"
