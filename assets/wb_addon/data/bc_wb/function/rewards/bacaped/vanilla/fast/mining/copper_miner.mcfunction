worldborder add 0.8
scoreboard players set blazeandcave:mining/copper_miner wb 1
tellraw @a {"text": " +0.4 Blocks", "color": "#B2FFEE", "hover_event": {"action": "show_text", "value": [{"translate": "Copper Miner", "color": "#75E1FF"}, {"text": "\n"}, {"translate": "Mine a stack of Raw Copper", "color": "#63BDD7"}, {"text": "\n\n"}, {"translate": "Mining", "color": "gray", "italic": true}]}}