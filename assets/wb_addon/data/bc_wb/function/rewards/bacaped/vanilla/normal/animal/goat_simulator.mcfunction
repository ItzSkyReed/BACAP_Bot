worldborder add 2.0 2
scoreboard players set blazeandcave:animal/goat_simulator wb 1
scoreboard players set is_wb_run wb 0
schedule function bc_wb:untask 2s
tellraw @a {"text": " +1.0 Blocks", "color": "#B2FFEE", "hover_event": {"action": "show_text", "value": [{"translate": "Goat Simulator", "color": "green"}, {"text": "\n"}, {"translate": "Get killed by a Goat that rammed into you.", "color": "#49DB49"}, {"text": "\n\n"}, {"translate": "Animals", "color": "gray", "italic": true}]}}