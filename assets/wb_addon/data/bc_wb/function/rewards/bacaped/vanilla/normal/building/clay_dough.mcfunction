worldborder add 0.1 1
scoreboard players set blazeandcave:building/clay_dough wb 1
scoreboard players set is_wb_run wb 0
schedule function bc_wb:untask 1s
tellraw @a {"text": " +0.05 Blocks", "color": "#B2FFEE", "hover_event": {"action": "show_text", "value": [{"translate": "Clay-Dough!", "color": "green"}, {"text": "\n"}, {"translate": "Dig up some clay from a lake", "color": "#49DB49"}, {"text": "\n\n"}, {"translate": "Building", "color": "gray", "italic": true}]}}