worldborder add 1.0 2
scoreboard players set blazeandcave:enchanting/god_of_thunder wb 1
scoreboard players set is_wb_run wb 0
schedule function bc_wb:untask 2s
tellraw @a {"text": " +0.5 Blocks", "color": "#B2FFEE", "hover_event": {"action": "show_text", "value": [{"translate": "God of Thunder", "color": "#75E1FF"}, {"text": "\n"}, {"translate": "Name your Trident with Loyalty III and Channeling 'Mjolnir'", "color": "#63BDD7"}, {"text": "\n\n"}, {"translate": "Enchanting", "color": "gray", "italic": true}]}}