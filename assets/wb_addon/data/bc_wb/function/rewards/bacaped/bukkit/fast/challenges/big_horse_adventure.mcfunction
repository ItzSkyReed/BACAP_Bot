execute in minecraft:overworld run worldborder add 400.0
execute in minecraft:the_nether run worldborder add 400.0
execute in minecraft:the_end run worldborder add 400.0
scoreboard players set bacaped:challenges/big_horse_adventure wb 1
tellraw @a {"text": " +200.0 Blocks", "color": "#B2FFEE", "hover_event": {"action": "show_text", "value": [{"translate": "Big Horse Adventure", "color": "#FF2A2A"}, {"text": "\n"}, {"translate": "Discover every biome in every dimension on a Horse", "color": "#DC2727"}, {"text": "\n\n"}, {"translate": "Super Challenges", "color": "gray", "italic": true}]}}