worldborder add 10.0 5
scoreboard players set blazeandcave:monsters/absolute_cinema wb 1
scoreboard players set is_wb_run wb 0
schedule function bc_wb:untask 5s
tellraw @a {"text": " +5.0 Blocks", "color": "#B2FFEE", "hover_event": {"action": "show_text", "value": [{"translate": "Absolute Cinema", "color": "dark_purple"}, {"text": "\n"}, {"translate": "Defeat a Chicken Jockey in a Woodland Mansion", "color": "#C900C7"}, {"text": "\n\n"}, {"translate": "Monsters", "color": "gray", "italic": true}]}}