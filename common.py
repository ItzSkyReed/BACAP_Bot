import discord


def error_embed(title: str, description: str = ""):
    return discord.Embed(title=title, description=description, color=discord.Color.red())


def format_float(value: int | float) -> float | int:
    return int(value) if value.is_integer() else value

def format_time(value: int) -> str:
    return f"{value} sec." if value < 120 else f"{round(value/60, 2)} min."


def to_title_style(string: str):
    return string.replace("_", " ").title()