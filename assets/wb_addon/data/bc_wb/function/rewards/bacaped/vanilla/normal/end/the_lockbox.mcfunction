worldborder add 0.1 1
scoreboard players set bacaped:end/the_lockbox wb 1
scoreboard players set is_wb_run wb 0
schedule function bc_wb:untask 1s
tellraw @a {"text": " +0.05 Blocks", "color": "#B2FFEE", "hover_event": {"action": "show_text", "value": [{"translate": "The Lockbox", "color": "dark_purple"}, {"text": "\n"}, {"translate": "Put the dragon egg in the ender chest", "color": "#C900C7"}, {"text": "\n\n"}, {"translate": "The End", "color": "gray", "italic": true}]}}