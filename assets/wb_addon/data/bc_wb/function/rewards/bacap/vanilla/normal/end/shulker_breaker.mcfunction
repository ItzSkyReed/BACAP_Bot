worldborder add 0.5 1
scoreboard players set blazeandcave:end/shulker_breaker wb 1
scoreboard players set is_wb_run wb 0
schedule function bc_wb:untask 1s
tellraw @a {"text": " +0.25 Blocks", "color": "#B2FFEE", "hover_event": {"action": "show_text", "value": [{"translate": "Shulker Breaker", "color": "#75E1FF"}, {"text": "\n"}, {"translate": "Collect a stack of shulker shells", "color": "#63BDD7"}, {"text": "\n\n"}, {"translate": "The End", "color": "gray", "italic": true}]}}