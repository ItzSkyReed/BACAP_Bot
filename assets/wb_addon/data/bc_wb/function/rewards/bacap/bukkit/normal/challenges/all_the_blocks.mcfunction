execute in minecraft:overworld run worldborder add 200.0 16
execute in minecraft:the_nether run worldborder add 200.0 16
execute in minecraft:the_end run worldborder add 200.0 16
scoreboard players set blazeandcave:challenges/all_the_blocks wb 1
scoreboard players set is_wb_run wb 0
schedule function bc_wb:untask 16s
tellraw @a {"text": " +100.0 Blocks", "color": "#B2FFEE", "hover_event": {"action": "show_text", "value": [{"translate": "All the Blocks!", "color": "#FF2A2A"}, {"text": "\n"}, {"translate": "Obtain all the blocks!", "color": "#DC2727"}, {"text": "\n\n"}, {"translate": "Super Challenges", "color": "gray", "italic": true}]}}