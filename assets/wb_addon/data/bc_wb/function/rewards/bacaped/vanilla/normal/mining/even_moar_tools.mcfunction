worldborder add 1.0 2
scoreboard players set blazeandcave:mining/even_moar_tools wb 1
scoreboard players set is_wb_run wb 0
schedule function bc_wb:untask 2s
tellraw @a {"text": " +0.5 Blocks", "color": "#B2FFEE", "hover_event": {"action": "show_text", "value": [{"translate": "Even MOAR Tools", "color": "green"}, {"text": "\n"}, {"translate": "Craft a full diamond tools set", "color": "#49DB49"}, {"text": "\n\n"}, {"translate": "Mining", "color": "gray", "italic": true}]}}