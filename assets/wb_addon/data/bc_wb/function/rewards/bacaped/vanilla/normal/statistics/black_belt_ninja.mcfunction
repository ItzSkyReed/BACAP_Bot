worldborder add 0.5 1
scoreboard players set blazeandcave:statistics/black_belt_ninja wb 1
scoreboard players set is_wb_run wb 0
schedule function bc_wb:untask 1s
tellraw @a {"text": " +0.25 Blocks", "color": "#B2FFEE", "hover_event": {"action": "show_text", "value": [{"translate": "Black Belt Ninja", "color": "#75E1FF"}, {"text": "\n"}, {"translate": "Sneak 1km", "color": "#63BDD7"}, {"text": "\n\n"}, {"translate": "Statistics", "color": "gray", "italic": true}]}}