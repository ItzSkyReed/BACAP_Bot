worldborder add 0.5 1
scoreboard players set blazeandcave:potion/hopping_mad wb 1
scoreboard players set is_wb_run wb 0
schedule function bc_wb:untask 1s
tellraw @a {"text": " +0.25 Blocks", "color": "#B2FFEE", "hover_event": {"action": "show_text", "value": [{"translate": "Hopping Mad", "color": "green"}, {"text": "\n"}, {"translate": "Get jump boost from a beacon or a potion", "color": "#49DB49"}, {"text": "\n\n"}, {"translate": "Potions", "color": "gray", "italic": true}]}}