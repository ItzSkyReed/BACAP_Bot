# [team=bac_team_yellow]

execute if score cc:challenges/complete_collection bac_obtained_yellow matches 1.. run advancement grant @a[team=bac_team_yellow] only cc:challenges/complete_collection
execute if score cc:challenges/imperfect_mirror bac_obtained_yellow matches 1.. run advancement grant @a[team=bac_team_yellow] only cc:challenges/imperfect_mirror
execute if score cc:challenges/illegal_collection bac_obtained_yellow matches 1.. run advancement grant @a[team=bac_team_yellow] only cc:challenges/illegal_collection
execute if score cc:challenges/its_a_secret_to_everybody bac_obtained_yellow matches 1.. run advancement grant @a[team=bac_team_yellow] only cc:challenges/its_a_secret_to_everybody