worldborder add 5.0 3
scoreboard players set blazeandcave:adventure/happy_trails wb 1
scoreboard players set is_wb_run wb 0
schedule function bc_wb:untask 3s
tellraw @a {"text": " +2.5 Blocks", "color": "#B2FFEE", "hover_event": {"action": "show_text", "value": [{"translate": "Happy Trails!", "color": "green"}, {"text": "\n"}, {"translate": "Discover the Trail Ruins", "color": "#49DB49"}, {"text": "\n\n"}, {"translate": "Adventure", "color": "gray", "italic": true}]}}