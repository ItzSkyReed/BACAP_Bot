worldborder add 0.5 1
scoreboard players set minecraft:adventure/spyglass_at_ghast wb 1
scoreboard players set is_wb_run wb 0
schedule function bc_wb:untask 1s
tellraw @a {"text": " +0.25 Blocks", "color": "#B2FFEE", "hover_event": {"action": "show_text", "value": [{"translate": "Is it a Balloon?", "color": "green"}, {"text": "\n"}, {"translate": "Look at a Ghast through a Spyglass", "color": "#49DB49"}, {"text": "\n\n"}, {"translate": "Nether", "color": "gray", "italic": true}]}}