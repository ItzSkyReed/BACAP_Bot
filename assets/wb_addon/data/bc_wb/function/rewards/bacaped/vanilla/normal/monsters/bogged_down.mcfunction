worldborder add 0.8 1
scoreboard players set blazeandcave:monsters/bogged_down wb 1
scoreboard players set is_wb_run wb 0
schedule function bc_wb:untask 1s
tellraw @a {"text": " +0.4 Blocks", "color": "#B2FFEE", "hover_event": {"action": "show_text", "value": [{"translate": "Bogged Down", "color": "green"}, {"text": "\n"}, {"translate": "Kill a Bogged. Watch those poison arrows!", "color": "#49DB49"}, {"text": "\n\n"}, {"translate": "Monsters", "color": "gray", "italic": true}]}}