worldborder add 0.5 1
scoreboard players set blazeandcave:farming/foliage wb 1
scoreboard players set is_wb_run wb 0
schedule function bc_wb:untask 1s
tellraw @a {"text": " +0.25 Blocks", "color": "#B2FFEE", "hover_event": {"action": "show_text", "value": [{"translate": "Foliage", "color": "green"}, {"text": "\n"}, {"translate": "Use shears to pick up short grass or ferns", "color": "#49DB49"}, {"text": "\n\n"}, {"translate": "Farming", "color": "gray", "italic": true}]}}