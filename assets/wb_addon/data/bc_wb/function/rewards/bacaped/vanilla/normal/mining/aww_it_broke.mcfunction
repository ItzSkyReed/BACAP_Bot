worldborder add 0.1 1
scoreboard players set blazeandcave:mining/aww_it_broke wb 1
scoreboard players set is_wb_run wb 0
schedule function bc_wb:untask 1s
tellraw @a {"text": " +0.05 Blocks", "color": "#B2FFEE", "hover_event": {"action": "show_text", "value": [{"translate": "Aww it broke!", "color": "green"}, {"text": "\n"}, {"translate": "Break your first tool", "color": "#49DB49"}, {"text": "\n\n"}, {"translate": "Mining", "color": "gray", "italic": true}]}}