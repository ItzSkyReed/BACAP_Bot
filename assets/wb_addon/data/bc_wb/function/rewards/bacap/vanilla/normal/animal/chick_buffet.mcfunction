worldborder add 5.0 3
scoreboard players set blazeandcave:animal/chick_buffet wb 1
scoreboard players set is_wb_run wb 0
schedule function bc_wb:untask 3s
tellraw @a {"text": " +2.5 Blocks", "color": "#B2FFEE", "hover_event": {"action": "show_text", "value": [{"translate": "Chick Buffet", "color": "#75E1FF"}, {"text": "\n"}, {"translate": "Unite all Chicken variants in one place", "color": "#63BDD7"}, {"text": "\n\n"}, {"translate": "Animals", "color": "gray", "italic": true}]}}