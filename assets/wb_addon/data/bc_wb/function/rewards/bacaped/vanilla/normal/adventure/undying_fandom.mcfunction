worldborder add 35.0 8
scoreboard players set blazeandcave:adventure/undying_fandom wb 1
scoreboard players set is_wb_run wb 0
schedule function bc_wb:untask 8s
tellraw @a {"text": " +17.5 Blocks", "color": "#B2FFEE", "hover_event": {"action": "show_text", "value": [{"translate": "Undying Fandom", "color": "dark_purple"}, {"text": "\n"}, {"translate": "Receive every type of gift from Villagers as a Hero of the Village", "color": "#C900C7"}, {"text": "\n\n"}, {"translate": "Adventure", "color": "gray", "italic": true}]}}