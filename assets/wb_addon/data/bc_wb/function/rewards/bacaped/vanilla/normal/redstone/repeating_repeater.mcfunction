worldborder add 0.05 1
scoreboard players set blazeandcave:redstone/repeating_repeater wb 1
scoreboard players set is_wb_run wb 0
schedule function bc_wb:untask 1s
tellraw @a {"text": " +0.025 Blocks", "color": "#B2FFEE", "hover_event": {"action": "show_text", "value": [{"translate": "Repeating Repeater", "color": "green"}, {"text": "\n"}, {"translate": "Craft a redstone repeater for delaying signals", "color": "#49DB49"}, {"text": "\n\n"}, {"translate": "Redstone", "color": "gray", "italic": true}]}}