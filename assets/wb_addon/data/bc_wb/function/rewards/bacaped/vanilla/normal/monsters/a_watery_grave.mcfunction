worldborder add 0.3 1
scoreboard players set blazeandcave:monsters/a_watery_grave wb 1
scoreboard players set is_wb_run wb 0
schedule function bc_wb:untask 1s
tellraw @a {"text": " +0.15 Blocks", "color": "#B2FFEE", "hover_event": {"action": "show_text", "value": [{"translate": "A Watery Grave", "color": "green"}, {"text": "\n"}, {"translate": "Defeat a drowned in the briny depths. ", "color": "#49DB49"}, {"text": "\n\n"}, {"translate": "Monsters", "color": "gray", "italic": true}]}}