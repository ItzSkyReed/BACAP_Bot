worldborder add 3.0 3
scoreboard players set blazeandcave:redstone/splatfest wb 1
scoreboard players set is_wb_run wb 0
schedule function bc_wb:untask 3s
tellraw @a {"text": " +1.5 Blocks", "color": "#B2FFEE", "hover_event": {"action": "show_text", "value": [{"translate": "Splatfest", "color": "dark_purple"}, {"text": "\n"}, {"translate": "Have at least 100 of each type of Chicken Egg fired in the air at once within 48 blocks of you", "color": "#C900C7"}, {"text": "\n\n"}, {"translate": "Redstone", "color": "gray", "italic": true}]}}