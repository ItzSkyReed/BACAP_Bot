worldborder add 0.1 1
scoreboard players set blazeandcave:adventure/oh_look_it_dings wb 1
scoreboard players set is_wb_run wb 0
schedule function bc_wb:untask 1s
tellraw @a {"text": " +0.05 Blocks", "color": "#B2FFEE", "hover_event": {"action": "show_text", "value": [{"translate": "Oh, look, it dings!", "color": "green"}, {"text": "\n"}, {"translate": "Ring a bell in a village", "color": "#49DB49"}, {"text": "\n\n"}, {"translate": "Adventure", "color": "gray", "italic": true}]}}