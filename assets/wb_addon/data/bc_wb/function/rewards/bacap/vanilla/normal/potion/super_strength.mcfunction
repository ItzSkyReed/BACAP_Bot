worldborder add 0.4 1
scoreboard players set blazeandcave:potion/super_strength wb 1
scoreboard players set is_wb_run wb 0
schedule function bc_wb:untask 1s
tellraw @a {"text": " +0.2 Blocks", "color": "#B2FFEE", "hover_event": {"action": "show_text", "value": [{"translate": "Super Strength", "color": "green"}, {"text": "\n"}, {"translate": "Brew a Strength Potion for cheating on weightlifting", "color": "#49DB49"}, {"text": "\n\n"}, {"translate": "Potions", "color": "gray", "italic": true}]}}