worldborder add 0.1 1
scoreboard players set blazeandcave:building/pot_planter wb 1
scoreboard players set is_wb_run wb 0
schedule function bc_wb:untask 1s
tellraw @a {"text": " +0.05 Blocks", "color": "#B2FFEE", "hover_event": {"action": "show_text", "value": [{"translate": "Pot Planter", "color": "green"}, {"text": "\n"}, {"translate": "Craft and place a flower pot", "color": "#49DB49"}, {"text": "\n\n"}, {"translate": "Building", "color": "gray", "italic": true}]}}