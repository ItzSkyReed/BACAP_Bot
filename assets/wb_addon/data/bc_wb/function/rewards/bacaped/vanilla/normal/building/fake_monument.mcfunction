worldborder add 4.0 3
scoreboard players set blazeandcave:building/fake_monument wb 1
scoreboard players set is_wb_run wb 0
schedule function bc_wb:untask 3s
tellraw @a {"text": " +2.0 Blocks", "color": "#B2FFEE", "hover_event": {"action": "show_text", "value": [{"translate": "Fake monument", "color": "green"}, {"text": "\n"}, {"translate": "Craft or collect all forms of prismarine blocks", "color": "#49DB49"}, {"text": "\n\n"}, {"translate": "Building", "color": "gray", "italic": true}]}}