worldborder add 0.05 1
scoreboard players set blazeandcave:animal/delicious_fish wb 1
scoreboard players set is_wb_run wb 0
schedule function bc_wb:untask 1s
tellraw @a {"text": " +0.025 Blocks", "color": "#B2FFEE", "hover_event": {"action": "show_text", "value": [{"translate": "Delicious Fish", "color": "green"}, {"text": "\n"}, {"translate": "Cook and eat a fish!", "color": "#49DB49"}, {"text": "\n\n"}, {"translate": "Animals", "color": "gray", "italic": true}]}}