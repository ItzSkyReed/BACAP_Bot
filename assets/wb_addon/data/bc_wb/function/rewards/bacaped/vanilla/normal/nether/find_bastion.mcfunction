worldborder add 8.0 4
scoreboard players set minecraft:nether/find_bastion wb 1
scoreboard players set is_wb_run wb 0
schedule function bc_wb:untask 4s
tellraw @a {"text": " +4.0 Blocks", "color": "#B2FFEE", "hover_event": {"action": "show_text", "value": [{"translate": "Those Were the Days", "color": "green"}, {"text": "\n"}, {"translate": "Fight your way into a Bastion Remnant", "color": "#49DB49"}, {"text": "\n\n"}, {"translate": "Nether", "color": "gray", "italic": true}]}}