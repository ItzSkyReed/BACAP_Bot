worldborder add 2.0 2
scoreboard players set blazeandcave:end/sky_high wb 1
scoreboard players set is_wb_run wb 0
schedule function bc_wb:untask 2s
tellraw @a {"text": " +1.0 Blocks", "color": "#B2FFEE", "hover_event": {"action": "show_text", "value": [{"translate": "Sky High", "color": "#75E1FF"}, {"text": "\n"}, {"translate": "Fly up beyond the world height limit", "color": "#63BDD7"}, {"text": "\n\n"}, {"translate": "The End", "color": "gray", "italic": true}]}}