worldborder add 0.05 1
scoreboard players set blazeandcave:statistics/the_first_night wb 1
scoreboard players set is_wb_run wb 0
schedule function bc_wb:untask 1s
tellraw @a {"text": " +0.025 Blocks", "color": "#B2FFEE", "hover_event": {"action": "show_text", "value": [{"translate": "The First Night", "color": "green"}, {"text": "\n"}, {"translate": "Survive the first night in your brand new world", "color": "#49DB49"}, {"text": "\n\n"}, {"translate": "Statistics", "color": "gray", "italic": true}]}}