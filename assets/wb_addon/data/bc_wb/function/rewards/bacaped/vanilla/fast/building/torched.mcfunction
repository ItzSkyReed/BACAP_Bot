worldborder add 0.05
scoreboard players set blazeandcave:building/torched wb 1
tellraw @a {"text": " +0.025 Blocks", "color": "#B2FFEE", "hover_event": {"action": "show_text", "value": [{"translate": "Torched!", "color": "green"}, {"text": "\n"}, {"translate": "Light up the area with some torches", "color": "#49DB49"}, {"text": "\n\n"}, {"translate": "Building", "color": "gray", "italic": true}]}}