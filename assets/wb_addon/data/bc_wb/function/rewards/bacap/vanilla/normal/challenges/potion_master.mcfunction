worldborder add 90.0 12
scoreboard players set blazeandcave:challenges/potion_master wb 1
scoreboard players set is_wb_run wb 0
schedule function bc_wb:untask 12s
tellraw @a {"text": " +45.0 Blocks", "color": "#B2FFEE", "hover_event": {"action": "show_text", "value": [{"translate": "Potion Master", "color": "#FF2A2A"}, {"text": "\n"}, {"translate": "Kill every mob in the game with splash potions", "color": "#DC2727"}, {"text": "\n\n"}, {"translate": "Super Challenges", "color": "gray", "italic": true}]}}