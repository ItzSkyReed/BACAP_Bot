worldborder add 1.5 2
scoreboard players set blazeandcave:redstone/noteworthy wb 1
scoreboard players set is_wb_run wb 0
schedule function bc_wb:untask 2s
tellraw @a {"text": " +0.75 Blocks", "color": "#B2FFEE", "hover_event": {"action": "show_text", "value": [{"translate": "Noteworthy", "color": "#75E1FF"}, {"text": "\n"}, {"translate": "Play every possible instrument on a Note Block", "color": "#63BDD7"}, {"text": "\n\n"}, {"translate": "Redstone", "color": "gray", "italic": true}]}}