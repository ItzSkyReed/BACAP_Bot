worldborder add 3.0
scoreboard players set blazeandcave:mining/gold_miner wb 1
tellraw @a {"text": " +1.5 Blocks", "color": "#B2FFEE", "hover_event": {"action": "show_text", "value": [{"translate": "Gold Miner", "color": "#75E1FF"}, {"text": "\n"}, {"translate": "Mine a stack of Raw Gold", "color": "#63BDD7"}, {"text": "\n\n"}, {"translate": "Mining", "color": "gray", "italic": true}]}}