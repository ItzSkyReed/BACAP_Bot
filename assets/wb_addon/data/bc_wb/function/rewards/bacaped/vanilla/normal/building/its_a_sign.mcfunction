worldborder add 0.05 1
scoreboard players set blazeandcave:building/its_a_sign wb 1
scoreboard players set is_wb_run wb 0
schedule function bc_wb:untask 1s
tellraw @a {"text": " +0.025 Blocks", "color": "#B2FFEE", "hover_event": {"action": "show_text", "value": [{"translate": "It's a Sign!", "color": "green"}, {"text": "\n"}, {"translate": "Craft and place a sign", "color": "#49DB49"}, {"text": "\n\n"}, {"translate": "Building", "color": "gray", "italic": true}]}}