worldborder add 0.5 1
scoreboard players set bacaped:adventure/wandering_caravane wb 1
scoreboard players set is_wb_run wb 0
schedule function bc_wb:untask 1s
tellraw @a {"text": " +0.25 Blocks", "color": "#B2FFEE", "hover_event": {"action": "show_text", "value": [{"translate": "Wandering Caravane", "color": "#75E1FF"}, {"text": "\n"}, {"translate": "Leash a Boat with a Wandering Trader and Trader Llama inside", "color": "#63BDD7"}, {"text": "\n\n"}, {"translate": "Adventure", "color": "gray", "italic": true}]}}