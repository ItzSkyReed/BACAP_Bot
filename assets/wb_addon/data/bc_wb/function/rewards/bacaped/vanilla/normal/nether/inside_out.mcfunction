worldborder add 0.1 1
scoreboard players set bacaped:nether/inside_out wb 1
scoreboard players set is_wb_run wb 0
schedule function bc_wb:untask 1s
tellraw @a {"text": " +0.05 Blocks", "color": "#B2FFEE", "hover_event": {"action": "show_text", "value": [{"translate": "Inside Out", "color": "#75E1FF"}, {"text": "\n"}, {"translate": "Use an Eye of Ender to locate a Stronghold... Inside the Stronghold!", "color": "#63BDD7"}, {"text": "\n\n"}, {"translate": "Nether", "color": "gray", "italic": true}]}}