worldborder add 0.8 1
scoreboard players set blazeandcave:building/deepslate_conspiracy wb 1
scoreboard players set is_wb_run wb 0
schedule function bc_wb:untask 1s
tellraw @a {"text": " +0.4 Blocks", "color": "#B2FFEE", "hover_event": {"action": "show_text", "value": [{"translate": "Deepslate Conspiracy", "color": "green"}, {"text": "\n"}, {"translate": "Craft all forms of Deepslate, Polished Deepslate, Deepslate Bricks and Deepslate Tiles", "color": "#49DB49"}, {"text": "\n\n"}, {"translate": "Building", "color": "gray", "italic": true}]}}