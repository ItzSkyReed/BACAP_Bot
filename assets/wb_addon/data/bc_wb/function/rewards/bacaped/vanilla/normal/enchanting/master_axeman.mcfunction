worldborder add 10.0 5
scoreboard players set blazeandcave:enchanting/master_axeman wb 1
scoreboard players set is_wb_run wb 0
schedule function bc_wb:untask 5s
tellraw @a {"text": " +5.0 Blocks", "color": "#B2FFEE", "hover_event": {"action": "show_text", "value": [{"translate": "Master Axeman", "color": "dark_purple"}, {"text": "\n"}, {"translate": "Create an axe with all possible enchantments at max level", "color": "#C900C7"}, {"text": "\n\n"}, {"translate": "Enchanting", "color": "gray", "italic": true}]}}