worldborder add 0.05 1
scoreboard players set blazeandcave:weaponry/egging_dude wb 1
scoreboard players set is_wb_run wb 0
schedule function bc_wb:untask 1s
tellraw @a {"text": " +0.025 Blocks", "color": "#B2FFEE", "hover_event": {"action": "show_text", "value": [{"translate": "Egging, Dude!", "color": "green"}, {"text": "\n"}, {"translate": "Vandalise something with eggs", "color": "#49DB49"}, {"text": "\n\n"}, {"translate": "Weaponry", "color": "gray", "italic": true}]}}