worldborder add 0.1
scoreboard players set blazeandcave:mining/a_shiny_treat wb 1
tellraw @a {"text": " +0.05 Blocks", "color": "#B2FFEE", "hover_event": {"action": "show_text", "value": [{"translate": "A Shiny Treat", "color": "green"}, {"text": "\n"}, {"translate": "Eat some Glow Berries", "color": "#49DB49"}, {"text": "\n\n"}, {"translate": "Mining", "color": "gray", "italic": true}]}}