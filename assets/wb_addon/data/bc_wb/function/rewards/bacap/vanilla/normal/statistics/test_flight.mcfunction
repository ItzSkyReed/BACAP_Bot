worldborder add 0.5 1
scoreboard players set blazeandcave:statistics/test_flight wb 1
scoreboard players set is_wb_run wb 0
schedule function bc_wb:untask 1s
tellraw @a {"text": " +0.25 Blocks", "color": "#B2FFEE", "hover_event": {"action": "show_text", "value": [{"translate": "Test Flight", "color": "green"}, {"text": "\n"}, {"translate": "Ride 100m on a Happy Ghast", "color": "#49DB49"}, {"text": "\n\n"}, {"translate": "Statistics", "color": "gray", "italic": true}]}}