worldborder add 3.0 3
scoreboard players set blazeandcave:building/pane_in_the_glass wb 1
scoreboard players set is_wb_run wb 0
schedule function bc_wb:untask 3s
tellraw @a {"text": " +1.5 Blocks", "color": "#B2FFEE", "hover_event": {"action": "show_text", "value": [{"translate": "Pane in the Glass", "color": "#75E1FF"}, {"text": "\n"}, {"translate": "Craft a stack of all 16 colors of stained glass panes", "color": "#63BDD7"}, {"text": "\n\n"}, {"translate": "Building", "color": "gray", "italic": true}]}}