worldborder add 0.2
scoreboard players set blazeandcave:farming/die_potato wb 1
tellraw @a {"text": " +0.1 Blocks", "color": "#B2FFEE", "hover_event": {"action": "show_text", "value": [{"translate": "Die, Potato!", "color": "green"}, {"text": "\n"}, {"translate": "Squash and eat a potato", "color": "#49DB49"}, {"text": "\n\n"}, {"translate": "Farming", "color": "gray", "italic": true}]}}