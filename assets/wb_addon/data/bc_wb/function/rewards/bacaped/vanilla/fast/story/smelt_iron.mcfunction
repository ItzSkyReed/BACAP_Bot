worldborder add 0.05
scoreboard players set minecraft:story/smelt_iron wb 1
tellraw @a {"text": " +0.025 Blocks", "color": "#B2FFEE", "hover_event": {"action": "show_text", "value": [{"translate": "Acquire Hardware", "color": "green"}, {"text": "\n"}, {"translate": "Smelt an iron ingot", "color": "#49DB49"}, {"text": "\n\n"}, {"translate": "Mining", "color": "gray", "italic": true}]}}