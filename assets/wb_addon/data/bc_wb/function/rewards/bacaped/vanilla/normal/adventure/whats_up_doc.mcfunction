worldborder add 0.2 1
scoreboard players set blazeandcave:adventure/whats_up_doc wb 1
scoreboard players set is_wb_run wb 0
schedule function bc_wb:untask 1s
tellraw @a {"text": " +0.1 Blocks", "color": "#B2FFEE", "hover_event": {"action": "show_text", "value": [{"translate": "What's Up, Doc?", "color": "green"}, {"text": "\n"}, {"translate": "Turn a mob upside-down", "color": "#49DB49"}, {"text": "\n\n"}, {"translate": "Adventure", "color": "gray", "italic": true}]}}