worldborder add 0.3 1
scoreboard players set blazeandcave:mining/nananananananana wb 1
scoreboard players set is_wb_run wb 0
schedule function bc_wb:untask 1s
tellraw @a {"text": " +0.15 Blocks", "color": "#B2FFEE", "hover_event": {"action": "show_text", "value": [{"translate": "Nananananananana...", "color": "green"}, {"text": "\n"}, {"translate": "Accidentally hit a bat underground", "color": "#49DB49"}, {"text": "\n\n"}, {"translate": "Mining", "color": "gray", "italic": true}]}}