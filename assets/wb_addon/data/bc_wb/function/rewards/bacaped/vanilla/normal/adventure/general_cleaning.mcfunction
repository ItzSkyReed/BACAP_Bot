worldborder add 20.0 6
scoreboard players set bacaped:adventure/general_cleaning wb 1
scoreboard players set is_wb_run wb 0
schedule function bc_wb:untask 6s
tellraw @a {"text": " +10.0 Blocks", "color": "#B2FFEE", "hover_event": {"action": "show_text", "value": [{"translate": "General Cleaning", "color": "dark_purple"}, {"text": "\n"}, {"translate": "Clean up each type of structure and spawner in the dungeon", "color": "#C900C7"}, {"text": "\n\n"}, {"translate": "Adventure", "color": "gray", "italic": true}]}}