# Asks "Are you sure?"

tellraw @s {"text":"                                             ","color":"dark_gray","strikethrough":true}
tellraw @s [" ",{"color":"yellow","translate":"Are you sure?"}]
tellraw @s {"text":"                                             ","color":"dark_gray","strikethrough":true}
tellraw @s [" ",{"color":"red","translate":"Once advancements are revoked, they cannot be recovered."}]
tellraw @s [" ",{"color":"gold","translate":"Some statistics advancements may come back automatically. If you wish for these to be reset too, you will need to delete the statistics file of players you want to revoke prior to revoking"}]
tellraw @s {"text":"                                             ","color":"dark_gray","strikethrough":true}
tellraw @s [" ",{"translate":"Please choose who you would like to revoke advancements from, or to go back"}]
tellraw @s {"text":"                                             ","color":"dark_gray","strikethrough":true}

tellraw @s ["",{"translate":"[ »» ]","color":"green","click_event":{"action":"run_command","command":"/function blazeandcave:config/revoke_yourself"},"hover_event":{"action":"show_text","value":["",{"translate":"Click to confirm","color":"gold"}]}}," ",{"translate":"Yourself"}]
tellraw @s ["",{"translate":"[ »» ]","color":"yellow","click_event":{"action":"run_command","command":"/function blazeandcave:config/revoke_closest"},"hover_event":{"action":"show_text","value":["",{"translate":"Click to confirm","color":"gold"}]}}," ",{"translate":"The closest player"}]
tellraw @s ["",{"translate":"[ »» ]","color":"dark_red","click_event":{"action":"run_command","command":"/function blazeandcave:config/revoke_everyone"},"hover_event":{"action":"show_text","value":["",{"translate":"Click to confirm","color":"gold"}," ",{"translate":">:)","color":"gold"}]}}," ",{"translate":"EVERYONE!! (who is online)"}]

tellraw @s {"text":"                                             ","color":"dark_gray","strikethrough":true}

# Go back I want to be MONKE
tellraw @s ["",{"text":"[ «« ]","color":"red","click_event":{"action":"run_command","command":"/function blazeandcave:config/technical_settings"},"hover_event":{"action":"show_text","value":["",{"translate":"Click to go back","color":"gold"}]}}," ",{"translate":"Go back"}]

tellraw @s {"text":"                                             ","color":"dark_gray","strikethrough":true}