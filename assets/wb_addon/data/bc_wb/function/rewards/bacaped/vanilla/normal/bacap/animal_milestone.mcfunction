worldborder add 500.0 24
scoreboard players set blazeandcave:bacap/animal_milestone wb 1
scoreboard players set is_wb_run wb 0
schedule function bc_wb:untask 24s
tellraw @a {"text": " +250.0 Blocks", "color": "#B2FFEE", "hover_event": {"action": "show_text", "value": [{"translate": "Animal Milestone", "color": "yellow"}, {"text": "\n"}, {"translate": "Complete every advancement in the Animal tab", "color": "#E5E74F"}, {"text": "\n\n"}, {"translate": "BlazeandCave's Advancements", "color": "gray", "italic": true}]}}