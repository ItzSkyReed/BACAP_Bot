worldborder add 1.5 2
scoreboard players set blazeandcave:biomes/everybody_loves_ice wb 1
scoreboard players set is_wb_run wb 0
schedule function bc_wb:untask 2s
tellraw @a {"text": " +0.75 Blocks", "color": "#B2FFEE", "hover_event": {"action": "show_text", "value": [{"translate": "Everybody Loves Ice!", "color": "#75E1FF"}, {"text": "\n"}, {"translate": "Obtain a stack of every type of ice in your inventory", "color": "#63BDD7"}, {"text": "\n\n"}, {"translate": "Biomes", "color": "gray", "italic": true}]}}