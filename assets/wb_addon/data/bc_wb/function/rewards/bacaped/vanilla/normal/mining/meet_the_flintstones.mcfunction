worldborder add 0.05 1
scoreboard players set blazeandcave:mining/meet_the_flintstones wb 1
scoreboard players set is_wb_run wb 0
schedule function bc_wb:untask 1s
tellraw @a {"text": " +0.025 Blocks", "color": "#B2FFEE", "hover_event": {"action": "show_text", "value": [{"translate": "Meet The Flintstones", "color": "green"}, {"text": "\n"}, {"translate": "Dig up some flint from a patch of gravel", "color": "#49DB49"}, {"text": "\n\n"}, {"translate": "Mining", "color": "gray", "italic": true}]}}