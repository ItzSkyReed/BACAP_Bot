worldborder add 0.4 1
scoreboard players set bacaped:animal/furry_fury wb 1
scoreboard players set is_wb_run wb 0
schedule function bc_wb:untask 1s
tellraw @a {"text": " +0.2 Blocks", "color": "#B2FFEE", "hover_event": {"action": "show_text", "value": [{"translate": "Furry Fury", "color": "#75E1FF"}, {"text": "\n"}, {"translate": "Take Damage from a Fox", "color": "#63BDD7"}, {"text": "\n\n"}, {"translate": "Animals", "color": "gray", "italic": true}]}}