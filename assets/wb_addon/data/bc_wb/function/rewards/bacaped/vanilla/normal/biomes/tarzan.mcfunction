worldborder add 0.1 1
scoreboard players set blazeandcave:biomes/tarzan wb 1
scoreboard players set is_wb_run wb 0
schedule function bc_wb:untask 1s
tellraw @a {"text": " +0.05 Blocks", "color": "#B2FFEE", "hover_event": {"action": "show_text", "value": [{"translate": "Tarzan", "color": "green"}, {"text": "\n"}, {"translate": "Swing (or climb) on some vines", "color": "#49DB49"}, {"text": "\n\n"}, {"translate": "Biomes", "color": "gray", "italic": true}]}}