worldborder add 2.0 2
scoreboard players set bacaped:farming/raising_canes wb 1
scoreboard players set is_wb_run wb 0
schedule function bc_wb:untask 2s
tellraw @a {"text": " +1.0 Blocks", "color": "#B2FFEE", "hover_event": {"action": "show_text", "value": [{"translate": "Raising Canes", "color": "#75E1FF"}, {"text": "\n"}, {"translate": "Plant Sugarcane on every possible block", "color": "#63BDD7"}, {"text": "\n\n"}, {"translate": "Farming", "color": "gray", "italic": true}]}}