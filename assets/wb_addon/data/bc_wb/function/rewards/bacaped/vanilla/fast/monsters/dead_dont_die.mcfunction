worldborder add 0.05
scoreboard players set blazeandcave:monsters/dead_dont_die wb 1
tellraw @a {"text": " +0.025 Blocks", "color": "#B2FFEE", "hover_event": {"action": "show_text", "value": [{"translate": "Dead Don't Die", "color": "green"}, {"text": "\n"}, {"translate": "Kill a zombie", "color": "#49DB49"}, {"text": "\n\n"}, {"translate": "Monsters", "color": "gray", "italic": true}]}}