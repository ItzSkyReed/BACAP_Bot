worldborder add 5.0 3
scoreboard players set bacaped:monsters/get_out_of_my_sky wb 1
scoreboard players set is_wb_run wb 0
schedule function bc_wb:untask 3s
tellraw @a {"text": " +2.5 Blocks", "color": "#B2FFEE", "hover_event": {"action": "show_text", "value": [{"translate": "Get Out of My Sky", "color": "dark_purple"}, {"text": "\n"}, {"translate": "Get killed by a Phantom while you are 320 blocks up in the sky", "color": "#C900C7"}, {"text": "\n\n"}, {"translate": "Monsters", "color": "gray", "italic": true}]}}