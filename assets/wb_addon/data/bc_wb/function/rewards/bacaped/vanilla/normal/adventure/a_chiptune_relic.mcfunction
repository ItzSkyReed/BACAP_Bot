worldborder add 4.0 3
scoreboard players set blazeandcave:adventure/a_chiptune_relic wb 1
scoreboard players set is_wb_run wb 0
schedule function bc_wb:untask 3s
tellraw @a {"text": " +2.0 Blocks", "color": "#B2FFEE", "hover_event": {"action": "show_text", "value": [{"translate": "A Chiptune Relic", "color": "#75E1FF"}, {"text": "\n"}, {"translate": "Excavate an ancient record from within the Trail Ruins", "color": "#63BDD7"}, {"text": "\n\n"}, {"translate": "Adventure", "color": "gray", "italic": true}]}}