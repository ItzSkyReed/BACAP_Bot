worldborder add 20.0 6
scoreboard players set blazeandcave:statistics/stonks wb 1
scoreboard players set is_wb_run wb 0
schedule function bc_wb:untask 6s
tellraw @a {"text": " +10.0 Blocks", "color": "#B2FFEE", "hover_event": {"action": "show_text", "value": [{"translate": "STONKS!", "color": "dark_purple"}, {"text": "\n"}, {"translate": "Trade with villagers 2500 times", "color": "#C900C7"}, {"text": "\n\n"}, {"translate": "Statistics", "color": "gray", "italic": true}]}}