import asyncio
import os
import sys

import discord
from pycord.multicog import Bot
from dotenv import load_dotenv

from Database import init_db
from DBGenerator import load_normal, load_comp_addon
from DatabaseController import DatabaseController

def pre_loading():
    DatabaseController.update_current_db()
    asyncio.run(init_db())
    load_normal()
    load_comp_addon()

def get_token():
    load_dotenv()
    if "--test" in sys.argv:
        token = os.getenv("BACAP_BOT_TEST_TOKEN")
        if not token:
            raise ValueError("BACAP_BOT_TEST_TOKEN environment variable not set")
    else:
        token = os.getenv("BACAP_BOT_TOKEN")
        if not token:
            raise ValueError("BACAP_BOT_TOKEN environment variable not set")
    return token

if __name__ == "__main__":
    if not "--test" in sys.argv:
        pre_loading()


    bot = Bot(intents=discord.Intents.all())
    bot.load_extension("cogs.AdvancementCog")
    bot.load_extension("cogs.TrophyCog")

    bot.run(get_token())