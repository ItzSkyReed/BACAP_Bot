worldborder add 0.8 1
scoreboard players set minecraft:husbandry/allay_deliver_cake_to_note_block wb 1
scoreboard players set is_wb_run wb 0
schedule function bc_wb:untask 1s
tellraw @a {"text": " +0.4 Blocks", "color": "#B2FFEE", "hover_event": {"action": "show_text", "value": [{"translate": "Birthday Song", "color": "#75E1FF"}, {"text": "\n"}, {"translate": "Have an Allay drop a cake at a note block", "color": "#63BDD7"}, {"text": "\n\n"}, {"translate": "Adventure", "color": "gray", "italic": true}]}}