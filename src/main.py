import discord

import Database
from DBGenerator.DBGen import load_normal, load_comp_addon

import asyncio
import os

from dotenv import load_dotenv

from DBGenerator.DatabaseController import DatabaseController


def pre_loading():
    DatabaseController.update_current_db()
    asyncio.run(Database.init_db())
    load_normal()
    load_comp_addon()

def get_token():
    load_dotenv()
    token = os.getenv("BACAP_BOT_TOKEN")
    if not token:
        raise ValueError("BACAP_BOT_TOKEN environment variable not set")
    return token

if __name__ == "__main__":
    pre_loading()

    bot = discord.Bot(intents=discord.Intents.all())
    bot.load_extension("cogs.AdvancementCog")
    bot.load_extension("cogs.TrophyCog")

    bot.run(get_token())