worldborder add 1.0 2
scoreboard players set blazeandcave:farming/undersea_gardener wb 1
scoreboard players set is_wb_run wb 0
schedule function bc_wb:untask 2s
tellraw @a {"text": " +0.5 Blocks", "color": "#B2FFEE", "hover_event": {"action": "show_text", "value": [{"translate": "Undersea Gardener", "color": "#75E1FF"}, {"text": "\n"}, {"translate": "Craft a stack of dried kelp blocks", "color": "#63BDD7"}, {"text": "\n\n"}, {"translate": "Farming", "color": "gray", "italic": true}]}}