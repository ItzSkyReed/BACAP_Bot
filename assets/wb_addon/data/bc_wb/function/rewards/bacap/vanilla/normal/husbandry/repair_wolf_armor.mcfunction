worldborder add 0.1 1
scoreboard players set minecraft:husbandry/repair_wolf_armor wb 1
scoreboard players set is_wb_run wb 0
schedule function bc_wb:untask 1s
tellraw @a {"text": " +0.05 Blocks", "color": "#B2FFEE", "hover_event": {"action": "show_text", "value": [{"translate": "Good as New", "color": "green"}, {"text": "\n"}, {"translate": "Repair damaged Wolf Armor using Armadillo Scutes", "color": "#49DB49"}, {"text": "\n\n"}, {"translate": "Animals", "color": "gray", "italic": true}]}}