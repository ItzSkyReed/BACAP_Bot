worldborder add 0.05
scoreboard players set blazeandcave:redstone/metal_plate wb 1
tellraw @a {"text": " +0.025 Blocks", "color": "#B2FFEE", "hover_event": {"action": "show_text", "value": [{"translate": "Metal Plate", "color": "green"}, {"text": "\n"}, {"translate": "Dinner time!", "color": "#49DB49"}, {"text": "\n\n"}, {"translate": "Redstone", "color": "gray", "italic": true}]}}