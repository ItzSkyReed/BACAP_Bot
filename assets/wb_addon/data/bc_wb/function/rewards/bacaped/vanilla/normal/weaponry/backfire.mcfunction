worldborder add 2.0 2
scoreboard players set blazeandcave:weaponry/backfire wb 1
scoreboard players set is_wb_run wb 0
schedule function bc_wb:untask 2s
tellraw @a {"text": " +1.0 Blocks", "color": "#B2FFEE", "hover_event": {"action": "show_text", "value": [{"translate": "Backfire", "color": "#75E1FF"}, {"text": "\n"}, {"translate": "Kill a Blaze using a Blaze Rod while both you and it are on fire", "color": "#63BDD7"}, {"text": "\n\n"}, {"translate": "Weaponry", "color": "gray", "italic": true}]}}