execute in minecraft:overworld run worldborder add 0.5 1
execute in minecraft:the_nether run worldborder add 0.5 1
execute in minecraft:the_end run worldborder add 0.5 1
scoreboard players set blazeandcave:potion/stealth_takedown wb 1
scoreboard players set is_wb_run wb 0
schedule function bc_wb:untask 1s
tellraw @a {"text": " +0.25 Blocks", "color": "#B2FFEE", "hover_event": {"action": "show_text", "value": [{"translate": "Stealth Takedown", "color": "green"}, {"text": "\n"}, {"translate": "Dispatch a Creeper at melee range while you are invisible", "color": "#49DB49"}, {"text": "\n\n"}, {"translate": "Potions", "color": "gray", "italic": true}]}}