worldborder add 0.15 1
scoreboard players set blazeandcave:animal/beeloons wb 1
scoreboard players set is_wb_run wb 0
schedule function bc_wb:untask 1s
tellraw @a {"text": " +0.075 Blocks", "color": "#B2FFEE", "hover_event": {"action": "show_text", "value": [{"translate": "Beeloons!", "color": "green"}, {"text": "\n"}, {"translate": "Attach a lead to a bee", "color": "#49DB49"}, {"text": "\n\n"}, {"translate": "Animals", "color": "gray", "italic": true}]}}