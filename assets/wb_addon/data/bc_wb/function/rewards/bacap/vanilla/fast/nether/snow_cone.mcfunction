worldborder add 0.2
scoreboard players set blazeandcave:nether/snow_cone wb 1
tellraw @a {"text": " +0.1 Blocks", "color": "#B2FFEE", "hover_event": {"action": "show_text", "value": [{"translate": "Snow Cone?", "color": "green"}, {"text": "\n"}, {"translate": "Feed snowballs to a Ghastling", "color": "#49DB49"}, {"text": "\n\n"}, {"translate": "Nether", "color": "gray", "italic": true}]}}