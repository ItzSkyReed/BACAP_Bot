# Function that updates your advancement score depending on how many advancements you have obtained in your world so far
# Should be run after updating datapack versions or when revoking advancements
# Display message
tellraw @s {"color":"green","translate":"The advancement count of all players currently online has been updated."}
# Set to 0
scoreboard players set @a bac_advancements 0
# Go through every advancement, and adds 1 to score if you have obtained that advancement

function #bacap_fanpacks:update_score

execute as @a[advancements={blazeandcave:adventure/businessman=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:adventure/disc_jockey=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:adventure/do_you_want_to_trade=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:adventure/dry_spell=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:adventure/filthy_rich=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:adventure/filthy_stinkin_rich=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:adventure/ghostbuster=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:adventure/grave_robber=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:adventure/guardian_destroyer=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:adventure/heres_johnny=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:adventure/house_of_psychos=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:adventure/i_hereby_dub_thee=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:adventure/if_only_cats_grew_into_kittens=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:adventure/laser_sharks=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:adventure/knowledge_is_power=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:adventure/mapmaker=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:adventure/monumental=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:adventure/murderer=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:adventure/music_to_my_ears=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:adventure/overpowered=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:adventure/raidin_master=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:adventure/rekt=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:adventure/secret_of_the_igloo=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:adventure/spear_fishing=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:adventure/sponge_miner=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:adventure/the_deep_end=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:adventure/the_shielding=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:adventure/tomb_raider=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:adventure/travelling_merchant=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:adventure/treasure_map=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:adventure/witchcraft=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:adventure/wololo=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:animal/a_horse_in_shining_armor=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:animal/aquarium=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:animal/are_we_there_yet=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:animal/artificial_selection=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:animal/bacon=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:animal/blistering_barnacles=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:animal/catching_nemo=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:animal/chatterbox=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:animal/chicken_cooper=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:animal/cow_tipper=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:animal/cowboy=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:animal/direct_fishing=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:animal/foal_play=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:animal/feeding_the_chickens=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:animal/feeling_sheepish=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:animal/fuzzy_feet=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:animal/getting_into_a_stew=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:animal/grinding_nemo=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:animal/have_a_shearful_day=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:animal/hey_look_mom=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:animal/high_steaks=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:animal/in_a_hole_there_lived_a_rabbit=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:animal/lucky_charm=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:animal/mary_had_a_little_lamb=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:animal/master_angler=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:animal/milk_does_your_body_good=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:animal/mooshroom_kingdom=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:animal/pig_slaughterer=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:animal/poacher=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:animal/pork_chop=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:animal/puppies_yipe=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:animal/rabbit_season=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:animal/rainbow_collection=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:animal/salmonella_poisoning=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:animal/scuttler=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:animal/sheariously=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:animal/so_good=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:animal/so_i_got_that_going_for_me=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:animal/someones_been_here_before=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:animal/stay_calmer=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:animal/super_mooshroom=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:animal/sushi=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:animal/theyre_breeding_like_rabbits=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:animal/tickle_time=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:animal/totally_not_an_afk_fisher=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:animal/treasure_hunter=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:farming/trimming_the_treetops=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:animal/tropical_collection=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:animal/true_cow_tipper=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:animal/turtle_army=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:animal/turtle_soldier=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:animal/what_a_piece_of_junk=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:animal/when_pigs_used_to_fly=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:animal/wooly=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:farming/yay_deadbush=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:animal/you_lead_ill_follow=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:bacap/getting_wood=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:bacap/root=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:bacap/time_to_chop=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:bacap/time_to_farm=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:bacap/time_to_mine=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:bacap/time_to_strike=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:biomes/atlantis=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:biomes/boaty_mcboatface=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:biomes/high_feet=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:biomes/dolphin_dasher=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:biomes/enchanted_forest=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:challenges/explorer_of_worlds=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:biomes/flower_power=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:biomes/ahoy=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:biomes/in_a_pickle=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:biomes/just_a_sample=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:biomes/just_keep_swimming=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:biomes/kilometre_walk=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:biomes/no_reefing=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:biomes/one_with_the_forest=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:biomes/overgrown=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:biomes/moskstraumen=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:biomes/pushed_around=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:biomes/root=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:biomes/cold_feet=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:biomes/spike_ice=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:biomes/tarzan=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:biomes/ten_thousand_blocks=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:biomes/the_great_blocky_reef=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:biomes/the_sea_calls_you=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:biomes/theres_a_zombie_on_the_lawn=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:biomes/thick_ice=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:biomes/thin_ice=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:biomes/titanic=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:biomes/voyage=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:biomes/warm_feet=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:biomes/wet_feet=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:biomes/x_marks_the_spot=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:building/a_masterpiece=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:building/ah_my_old_enemy=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:building/barking_mad=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:building/bricks=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:building/change_of_sheets=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:building/classy_glassy=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:building/clay_dough=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:building/concrete_evidence=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:building/creepers_and_withers=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:building/help_ive_been_framed=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:building/electric=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:building/en_garde=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:building/expensive=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:building/fake_fortress=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:building/fake_monument=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:building/fake_stronghold=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:building/fluorescent=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:building/glowing=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:building/greek_art_decor=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:building/halloween=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:building/its_a_sign=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:building/its_a_trap=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:building/jailhouse_block=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:building/ladder_climbers_inc=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:building/lost_its_bark=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:building/mannequin=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:building/master_logger=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:building/no_banner_only_color=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:building/pathways=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:building/pot_planter=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:building/professor_birch=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:building/professor_dark_oak=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:building/professor_oak=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:building/rainbow_dreams=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:building/rainbow_sand=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:building/raise_the_flag=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:building/rock_collection=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:building/root=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:building/slabs_for_days=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:building/spruce_lee=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:building/stationary_storage=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:building/stripper=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:building/the_acacia_king=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:building/the_glazed_terracotta_army=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:building/the_jungler=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:building/the_rainbow_you_always_wanted=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:building/the_terracotta_army=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:building/the_walls=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:building/torched=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:building/translucence=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:building/what_a_pane=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:building/yay_i_got_my_wood=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:building/your_door_was_locked=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:monsters/a_watery_grave=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:monsters/anti_air=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:monsters/because_im_aquaman=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:monsters/blast_shield=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:monsters/boned=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:monsters/camouflage=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:monsters/creeper_killer=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:monsters/creepy_heads=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:monsters/dead_dont_die=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:monsters/desert_nomad=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:monsters/dungeon_crawler=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:monsters/ender_worm=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:monsters/enderman_destroyer=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:biomes/barbearian=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:monsters/ew_ew_ew=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:monsters/freezing=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:monsters/frosty=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:monsters/gelatinous_cube=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:monsters/hell_hunter=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:monsters/iron_belly=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:monsters/keep_your_distance=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:monsters/melting=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:monsters/night_runner=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:monsters/phantom_slayer=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:monsters/plane_walker=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:monsters/poisonous_ew=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:monsters/ricochet_swoop=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:monsters/root=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:monsters/skeleton_smiter=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:monsters/slime_squisher=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:monsters/spider_smasher=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:monsters/spooky_skeleton=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:monsters/spooky_skulls=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:monsters/still_talking=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:monsters/taste_of_your_own_medicine=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:monsters/tele_morph=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:monsters/termite_control=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:monsters/the_ender_of_ender=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:monsters/the_ghastly_eyes=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:monsters/the_phantom_menace=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:monsters/the_undead_cavalry=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:monsters/there_has_to_be_another_way=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:monsters/trampoline=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:monsters/tridented_shield=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:monsters/void_ender=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:monsters/well_handle_this=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:monsters/what_a_creep=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:monsters/witch=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:monsters/zombie_slayer=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:enchanting/armor_for_the_masses=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:enchanting/bane_of_one_shotting_spiders=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:enchanting/boomerang=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:enchanting/bow_down_to_me=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:enchanting/complete_enchanter=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:enchanting/curses=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:enchanting/do_a_barrel_roll=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:enchanting/fiery=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:enchanting/fortunate_son=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:enchanting/knocking_your_socks_off=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:enchanting/let_it_go=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:enchanting/librarian=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:enchanting/like_a_cat=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:enchanting/master_armorer=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:enchanting/master_enchanter=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:enchanting/master_fisher=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:enchanting/master_knight=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:enchanting/master_miner=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:enchanting/master_sniper=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:enchanting/master_tridenteer=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:enchanting/needle_sharp=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:enchanting/newtons_flaming_laser_sword=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:enchanting/heavy_metal=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:enchanting/overkill=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:enchanting/pick_like_silk=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:enchanting/root=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:enchanting/scuba_gear=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:enchanting/super_efficient=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:enchanting/to_infinity_and_beyond=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:challenges/ultimate_enchanter=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:enchanting/unbreakable=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:enchanting/undead_slayer=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:enchanting/zeus=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:end/anti_gravity_generator=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:end/cow_jumped_over_the_moon=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:end/dragon_shield=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:end/end_bricks=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:end/extrabiologist=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:end/for_mother_clarence=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:end/getting_chorus=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:end/im_coming_back_murph=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:end/no_dont_let_me_leave_murph=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:end/off_with_his_head=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:end/portable_storage=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:end/purpurfect=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:end/shouldnt_my_shield_levitate_too=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:end/shulker_breaker=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:end/sky_high=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:end/some_breakthrough=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:end/somewhere_over_the_rainbow=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:end/the_point_of_no_return=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:end/the_start_of_something=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:end/uh_houston_we_have_a_problem=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:end/void_walker=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:potion/furious_ammunition=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:potion/noxious_fumes=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:monsters/poison_dart=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:farming/24_carrot_gold=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:farming/an_amazing_story=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:farming/aquatic_biofuel=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:farming/bake_bread=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:farming/bapple=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:farming/scientific_inaccuracy=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:farming/care_for_the_environment=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:farming/die_potato=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:farming/olaf=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:farming/ecologist=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:farming/hay_there=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:farming/its_a_cactus=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:farming/its_full_of_ink=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:farming/its_where_nutella_comes_from=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:farming/kelp_me=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:farming/me_love_cookie=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:farming/meat_lovers=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:farming/mega_mushroom=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:farming/mushroom_mushroom=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:farming/naturally_carved=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:farming/not_today=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:farming/pumpa_kungen=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:farming/root=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:farming/shrooms=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:farming/souperman=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:farming/spikey=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:farming/sugar_sugar=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:farming/the_lie=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:farming/the_melon_the_melon_the_melon=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:farming/the_meloncholy_dane=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:farming/the_pie=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:farming/ultra_hardcore=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:farming/undersea_gardener=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:farming/vegetarian=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:farming/write_your_thoughts=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:mining/bling_bling_gone=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:mining/coal_miner=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:mining/diamond_clad=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:mining/diamond_miner=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:mining/eeuuwww=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:mining/even_moar_tools=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:mining/flint_miner=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:mining/fossil_fuel=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:mining/gold_mine=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:mining/gold_miner=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:mining/gold_rush=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:mining/hot_topic=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:mining/iconic_merchandising_prop=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:mining/iron_man=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:mining/iron_miner=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:mining/lapis_lazuli_miner=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:mining/living_like_kings=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:mining/master_coal_miner=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:mining/master_diamond_miner=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:mining/master_gold_miner=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:mining/master_iron_miner=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:mining/meet_the_flintstones=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:mining/mineral_collection=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:mining/moar_tools=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:mining/my_work_here_is_done=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:mining/nananananananana=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:mining/obsidian_miner=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:mining/aww_it_broke=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:mining/redstone_miner=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:mining/renewable_energy=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:mining/rock_bottom=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:mining/root=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:mining/seeing_red=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:mining/spelunker=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:mining/stabcraft=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:mining/the_mistake=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:mining/the_way_to_spawn=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:mining/diam_oh_wait_no=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:mining/this_is_mine_now=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:mining/weve_broken_our_last_shovel=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:mining/whats_the_time_mr_wolf=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:nether/basis_of_brewing=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:nether/blaze_extinguisher=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:nether/bring_down_the_beast=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:nether/stepping_on_legos=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:nether/enders_chest=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:nether/fire_blast_shield=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:nether/ghast_slayer=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:nether/giant_floating_jellyfish=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:nether/glows_in_the_dark=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:nether/glowstone_miner=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:nether/high_temperature_fluid_monster=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:nether/limbo_walker=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:nether/magma_cube_squisher=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:nether/quicksand=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:nether/seeing_stars=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:nether/the_hunt_begins=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:nether/the_nethers_shield=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:nether/the_tribal_snouts=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:potion/a_much_more_doable_challenge=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:potion/a_weak_brew=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:potion/death_by_magic=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:potion/hopping_mad=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:potion/hyper_healing=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:potion/medic=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:potion/marine_marauder=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:potion/nocturnal=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:potion/performance_enhancing_drugs=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:potion/root=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:potion/stayin_frosty=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:potion/super_strength=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:potion/tank=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:potion/the_invisible_player=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:potion/true_feather_falling=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:redstone/bling_plate=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:redstone/comparing_comparator=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:redstone/fuel_engine=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:redstone/dispense_with_this=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:redstone/electric_rails=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:redstone/engineer=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:redstone/master_engineer=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:redstone/metal_plate=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:redstone/mobile_explosion=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:redstone/moving_moving_storage=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:redstone/moving_parts=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:redstone/moving_storage=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:redstone/mozart=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:redstone/observer_buddy=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:redstone/all_aboard=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:redstone/powerful_light=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:redstone/pressure_detector=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:redstone/quartz_miner=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:redstone/quirky_quartz=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:redstone/railwayman=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:redstone/repeating_repeater=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:redstone/root=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:redstone/solar_power=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:redstone/space_dropper=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:redstone/space_hopper=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:redstone/sticky_parts=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:redstone/tripping_over=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:redstone/troll_chest=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:redstone/under_pressure=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:weaponry/bombs_away=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:weaponry/bow_spammer=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:weaponry/egging_dude=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:weaponry/fireworks_display=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:weaponry/point_blank=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:weaponry/poseidon_vs_hades=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:weaponry/root=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:weaponry/snowball_fight=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:weaponry/the_aquatic_hunter=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:weaponry/the_mighty_hunter=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:weaponry/king_of_the_sea=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={minecraft:adventure/adventuring_time=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={minecraft:adventure/kill_a_mob=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={minecraft:adventure/kill_all_mobs=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={minecraft:adventure/root=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={minecraft:adventure/shoot_arrow=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={minecraft:adventure/sleep_in_bed=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={minecraft:adventure/sniper_duel=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={minecraft:adventure/summon_iron_golem=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={minecraft:adventure/throw_trident=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={minecraft:adventure/totem_of_undying=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={minecraft:adventure/trade=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={minecraft:adventure/very_very_frightening=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={minecraft:adventure/two_birds_one_arrow=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={minecraft:adventure/ol_betsy=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={minecraft:adventure/whos_the_pillager_now=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={minecraft:adventure/arbalistic=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={minecraft:end/dragon_breath=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={minecraft:end/dragon_egg=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={minecraft:end/elytra=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={minecraft:end/enter_end_gateway=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={minecraft:end/find_end_city=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={minecraft:end/kill_dragon=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={minecraft:end/levitate=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={minecraft:end/respawn_dragon=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={minecraft:end/root=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={minecraft:husbandry/balanced_diet=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={minecraft:husbandry/break_diamond_hoe=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={minecraft:husbandry/bred_all_animals=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={minecraft:husbandry/breed_an_animal=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={minecraft:husbandry/fishy_business=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={minecraft:husbandry/plant_seed=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={minecraft:husbandry/root=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={minecraft:husbandry/tactical_fishing=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={minecraft:husbandry/tame_an_animal=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={minecraft:husbandry/complete_catalogue=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={minecraft:nether/all_effects=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={minecraft:nether/all_potions=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={minecraft:nether/brew_potion=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={minecraft:nether/create_beacon=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={minecraft:nether/create_full_beacon=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={minecraft:nether/fast_travel=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={minecraft:nether/find_fortress=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={minecraft:nether/get_wither_skull=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={minecraft:nether/obtain_blaze_rod=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={minecraft:nether/return_to_sender=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={minecraft:nether/root=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={minecraft:nether/summon_wither=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={minecraft:nether/uneasy_alliance=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={minecraft:story/cure_zombie_villager=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={minecraft:story/deflect_arrow=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={minecraft:story/enchant_item=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={minecraft:story/enter_the_end=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={minecraft:story/enter_the_nether=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={minecraft:story/follow_ender_eye=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={minecraft:story/form_obsidian=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={minecraft:story/iron_tools=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={minecraft:story/lava_bucket=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={minecraft:story/mine_diamond=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={minecraft:story/mine_stone=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={minecraft:story/obtain_armor=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={minecraft:story/root=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={minecraft:story/shiny_gear=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={minecraft:story/smelt_iron=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={minecraft:story/upgrade_tools=true}] run scoreboard players add @s bac_advancements 1

# The following advancements were added in version 1.6
execute as @a[advancements={blazeandcave:adventure/oh_look_it_dings=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:adventure/mapmakers_table=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:adventure/all_chained_up=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:adventure/retro_future_knight=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:adventure/crazy_cat_lady=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:adventure/the_tribal_villagers=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:adventure/lilypad_hatter=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:challenges/stockbroker=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:adventure/you_are_the_pillager=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:adventure/traveller=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:adventure/shady_deals=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:adventure/florist=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:adventure/rebuilding_the_oceans=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:adventure/deals_off=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:adventure/out_of_posts=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={minecraft:adventure/voluntary_exile=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:adventure/riot_shield=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:adventure/its_so_beast_like=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:adventure/i_am_ravager_hear_me_roar=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:adventure/picador=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:adventure/war_is_coming=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:adventure/feeling_ill=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:adventure/professional=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:adventure/master_trader=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:adventure/village_settler=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:adventure/town_planner=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={minecraft:adventure/hero_of_the_village=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:adventure/veteran_of_the_village=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:animal/cool_kids=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:animal/fashion_statement=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:animal/shoe_shed=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:animal/which_came_first=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:animal/horse_armorer=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:animal/colorful_cavalry=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:animal/master_farrier=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:animal/birdkeeper=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:animal/llama_llama_duck_king=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:animal/bunny_lover=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:animal/what_does_the_fox_say=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:animal/snow_fox_64=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:animal/mushroom_scientist=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:biomes/for_you_my_sweet=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:biomes/the_mighty_jungle=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:biomes/simba=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:biomes/bamboom=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:biomes/construction_worker=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:biomes/top_of_the_world=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:biomes/zoologist=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:biomes/kung_fu_panda=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:building/crazy_walls=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:building/barrel_rider=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:building/writers_block=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:building/prepare_to_meet_your_loom=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:building/fruit_of_the_looms=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:building/festival_of_lights=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:monsters/ooh_baby=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:monsters/baby_baby_baby_noo=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:nether/legend_of_hell_chicken_riders=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:monsters/custom_boss_fight=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:monsters/mollusc_man=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:monsters/captain_etho=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:monsters/trick_or_treat=true}] run scoreboard players add @s bac_advancements 1
#execute as @a[advancements={blazeandcave:monsters/handsome_jack=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:enchanting/machine_bow=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:enchanting/shotbow=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:enchanting/master_arbalist=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:mining/emerald_miner=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:end/the_actual_end=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:end/the_beginning=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:farming/berry_nice=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:farming/disen_berry_berry_bad=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:farming/suspicious_looking_stew=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:farming/im_gonna_be_sick=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:farming/the_garbage_will_do=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:building/camping_out=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:building/spawn_camping=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:mining/smokin_hot=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:mining/not_chicken_mcnuggets=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:building/its_original_form=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:building/smooth_dude=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:building/blast_it=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:building/sharpening_station=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:building/agent_smithing_table=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:building/classic_pocket_edition_block=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:adventure/beethoven=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:mining/rest_in_pickaxes=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:mining/moar_broken_tools=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:mining/where_are_all_your_clothes=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:nether/hells_bells=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:nether/decaying_beauty=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:potion/gas=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:weaponry/x_bow=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:weaponry/explosive_fire=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:weaponry/that_is_so_fletch=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:weaponry/revenge=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:weaponry/demolitions_expert=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:weaponry/a_snowballs_chance_in_hell=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:weaponry/theres_yolk_on_my_head=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:weaponry/sir_knight=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:weaponry/flying_colors=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:weaponry/shield_luck=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:weaponry/master_shieldsman=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:weaponry/viking=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:weaponry/axeman=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:weaponry/shovel_knight=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:weaponry/expelliarmus=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:weaponry/slapfish=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:weaponry/diemonds=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:weaponry/pig_fishing_tournament=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:weaponry/indiana_jones=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:weaponry/when_pigs_finally_fly=true}] run scoreboard players add @s bac_advancements 1

# The following advancements were added in version 1.7
execute as @a[advancements={blazeandcave:building/i_dont_like_sand=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:building/insomniac=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:building/art_gallery=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:mining/chestful_of_cobblestone=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:building/bubble_bubble_toil_and_trouble=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:building/washing_machine=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:farming/must_be_your_birthday=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:farming/castaway=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:biomes/free_diver=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:biomes/sleep_with_the_fishes=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:biomes/qinling=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:adventure/were_being_attacked=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:adventure/superhero_of_the_village=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:monsters/aww_man=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:monsters/spider_skeleton=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:monsters/oh_no_guys_im_oozing=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:weaponry/artillery=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:enchanting/magical_stockpile=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:statistics/root=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:statistics/out_for_a_stroll=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:statistics/who_needs_cars=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:statistics/i_enjoy_long_walks_and_playing_minecraft=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:statistics/marathon=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:statistics/your_legs_must_be_tired=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:statistics/natural_sprinter=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:statistics/spring_in_your_step=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:statistics/boing_boing=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:statistics/jumping_jacks=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:statistics/sneaky_snitch=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:statistics/black_belt_ninja=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:statistics/ancient_kung_fu_master=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:statistics/laps_in_the_pool=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:statistics/olympic_athlete=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:statistics/olympic_gold_medallist=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:statistics/minecart_rider=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:statistics/i_like_trains=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:statistics/global_railway_network=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:statistics/pig_training=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:statistics/snout_500=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:statistics/lightning_mcpig=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:statistics/horse_training=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:statistics/sheriff_firearm=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:statistics/scourge_of_the_west=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:statistics/luxury_cruise=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:statistics/pirate_captain=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:statistics/sailor_of_the_seven_seas=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:statistics/take_to_the_skies=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:statistics/supersonic=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:statistics/frequent_flyer=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:statistics/the_parrots_and_the_bats=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:statistics/cupid=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:statistics/two_by_two=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:statistics/novice_enchanter=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:statistics/journeyman_enchanter=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:statistics/elderly_enchanter=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:statistics/level_up=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:statistics/overlevelling=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:statistics/xp_grinder=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:statistics/the_first_night=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:statistics/passing_the_time=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:statistics/happy_new_year=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:potion/mad_scientist=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:potion/a_furious_test_subject=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:end/event_horizon=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:end/dragon_vs_dragon=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:end/rocketman=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:challenges/root=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:challenges/all_the_blocks=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:challenges/all_the_items=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:challenges/stack_all_the_blocks=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:challenges/stack_all_the_items=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:challenges/potion_master=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:challenges/biological_warfare=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:challenges/global_vaccination=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:challenges/death_from_all=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:challenges/nuclear_fusion=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:challenges/zombie_apocalypse=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:challenges/rise_of_the_skeletons=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:challenges/creepergeddon=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:challenges/dragon_army=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:challenges/the_world_is_ending=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:challenges/warlock=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:challenges/were_in_the_endgame_now=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:challenges/immortal=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:challenges/abyss_lord=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:challenges/a_million_blocks_away=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:challenges/highway_to_hell=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:challenges/endergeddon=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:challenges/im_in_space=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:challenges/dragon_vs_dragon_ii_electric_boogaloo=true}] run scoreboard players add @s bac_advancements 1

# The following advancements were added in version 1.8
execute as @a[advancements={blazeandcave:animal/ya_like_jazz=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={minecraft:husbandry/safely_harvest_honey=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:animal/winnie_the_pooh=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={minecraft:adventure/honey_block_slide=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:animal/wheres_the_honey_lebowski=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:animal/hive_mind=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={minecraft:husbandry/silk_touch_nest=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:animal/honey_im_home=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:animal/not_the_bees=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:building/and_open=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:building/stairs_no=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:building/cut_in_half=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:biomes/everybody_loves_ice=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:farming/full_stomach=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:mining/heart_of_darkness=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:nether/im_in_lava_with_you=true}] run scoreboard players add @s bac_advancements 1

# The following advancements were added in version 1.9
execute as @a[advancements={blazeandcave:bacap/adventure_milestone=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:bacap/animal_milestone=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:bacap/biomes_milestone=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:bacap/building_milestone=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:bacap/challenges_milestone=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:bacap/enchanting_milestone=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:bacap/end_milestone=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:bacap/farming_milestone=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:bacap/mining_milestone=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:bacap/monsters_milestone=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:bacap/nether_milestone=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:bacap/potion_milestone=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:bacap/redstone_milestone=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:bacap/statistics_milestone=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:bacap/weaponry_milestone=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:bacap/advancement_legend=true}] run scoreboard players add @s bac_advancements 1

# The following advancements were added in version 1.10
execute as @a[advancements={blazeandcave:mining/dungeons_and_spawners=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:mining/steals_on_wheels=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:building/delicious_hot_schmoes=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:mining/oresome=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:building/grass_type=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:building/shroom_lightyear=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:building/cerulean=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:building/let_there_be_light=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:building/no_chain_no_gain=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:building/blackstonehenge=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:building/colors_of_the_wind=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:farming/a_gluttonous_diet=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:farming/natural_fertiliser=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:farming/combine_harvester=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:farming/whats_new_with_composting=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:farming/foliage=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:animal/going_down_the_rabbit_hole=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:animal/just_keeps_going=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:animal/nest_quick=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:animal/heavy_duty_caravan=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:animal/save_the_turtles=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:biomes/so_long_and_thanks_for_all_the_fish=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:adventure/now_youre_thinking_with_portals=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:adventure/i_just_want_to_make_toast=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:adventure/whats_up_doc=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:adventure/nyan_sheep=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:adventure/slenderman=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:adventure/the_one_and_true_johnny=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:adventure/prime_specimen=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={minecraft:adventure/trade_at_world_height=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:adventure/redemption_arc=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:adventure/workaholic=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:challenges/i_am_loot=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:monsters/paleontologist=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:monsters/impossible=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:monsters/family_reunion=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:monsters/bone_to_party=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:weaponry/loser=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:weaponry/multiclassed=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:weaponry/pyrotechnic=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:weaponry/my_eyes=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:weaponry/who_ya_gonna_call=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:redstone/target_acquired=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={minecraft:adventure/bullseye=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:redstone/target_practise=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:enchanting/this_name_sounds_cooler=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:enchanting/ill_be_back=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:enchanting/god_of_thunder=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:enchanting/a_rather_pointy_fence_post=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:enchanting/gotta_go_fast=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:enchanting/handmade_blinding=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:enchanting/master_digger=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:enchanting/master_axeman=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:enchanting/master_farmer=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:statistics/mob_hunter=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:statistics/bloodthirsty=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:statistics/kill_or_be_killed=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:statistics/taking_it_in_stride=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:statistics/who_needs_boats=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:statistics/this_ride_is_lit_yo=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:nether/stem_research=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:nether/what_a_fungi=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:nether/i_am_root=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:nether/dont_blink=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:nether/twisted=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:nether/what_about_corruption_planks=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:nether/welcome_to_warp_zone=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={minecraft:nether/explore_nether=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:nether/hell_botanist=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:nether/spreading_corruption=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:nether/the_struggle_nether_ends=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:nether/roadhog=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:nether/when_hoglins_breed=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:nether/whole_hog=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:nether/giddy_up=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:nether/zork_chop=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={minecraft:nether/ride_strider=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:nether/bobbleheads=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:nether/this_ones_mine=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={minecraft:nether/distract_piglin=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:nether/cultural_misunderstandings=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={minecraft:nether/obtain_crying_obsidian=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:nether/anchorman=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={minecraft:nether/charge_respawn_anchor=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:nether/we_got_a_live_one=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:nether/when_piglins_fly=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:nether/electrifying_alliance=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:nether/time_to_fire_back=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:nether/from_whence_it_came=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={minecraft:nether/find_bastion=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={minecraft:nether/loot_bastion=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:nether/gilty=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:nether/wub_wub_wub=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:nether/nugget_in_a_biscuit=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:nether/dark_ages=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:nether/burnt_right_into_your_soul=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:nether/a_soul_for_a_soul=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:nether/let_me_out=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:nether/inception=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:nether/the_descent=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={minecraft:nether/obtain_ancient_debris=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:nether/holy_scrap=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:nether/diamonds_are_not_forever=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:nether/moar_upgraded_tools=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={minecraft:nether/netherite_armor=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:nether/soul_runnings=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:nether/fool_me_twice=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:mining/get_a_lode_of_this=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={minecraft:adventure/use_lodestone=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:mining/lodes_of_applications=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:nether/netherite_miner=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:potion/failed_concoctions=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:end/what_for=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:end/ring_of_the_end=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:end/in_your_face_neil_armstrong=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:end/organizational_wizard=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:end/a_wizards_breakfast=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:challenges/constellation=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:challenges/hearts_of_the_stack=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:challenges/the_devils_distance=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:challenges/ad_astra=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:challenges/dragon_vs_wither_the_pre_sequel=true}] run scoreboard players add @s bac_advancements 1

# The following advancements were added in version 1.11
execute as @a[advancements={blazeandcave:bacap/time_to_dig=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:mining/diamonds_to_you=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:building/one_pickle_two_pickle_sea_pickle_four=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:building/harry_potter=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:building/armor_display=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:farming/unmasked=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:animal/delicious_fish=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:animal/milkshroom=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:animal/live_and_let_dye=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:animal/foxy_thievery=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:animal/lead_the_way=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:animal/beeloons=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:animal/follow_the_leader=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:biomes/echolocation=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:biomes/lion_hunter=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:adventure/your_daily_fix=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:adventure/im_not_lost_anymore=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:monsters/controlled_detonation=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:monsters/miracle_drink=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:monsters/dead_really_dont_die=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:weaponry/half_heart_life=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:nether/brute_force=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:nether/et_tu_brute=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:nether/hot_reels=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:nether/nether_rock_collection=true}] run scoreboard players add @s bac_advancements 1

# The following advancements were added in version 1.12
execute as @a[advancements={blazeandcave:mining/youll_never_take_me_alive_copper=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:mining/budget_channeling=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:mining/dont_come_a_copper=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:mining/copper_miner=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:mining/master_copper_miner=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={minecraft:husbandry/wax_on=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:mining/the_statue_of_liberty=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:mining/sly_copper_the_copper_heist=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:mining/gi_geode=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:mining/good_for_your_bones=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:mining/galileo_figaro=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:mining/blackout=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:mining/amethyst_miner=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:mining/lichen_subscribe=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:mining/thats_the_point=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:mining/deep_slate_nine=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:building/tuff_stuff=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:mining/moss_maker=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:mining/iggy=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:mining/particle_fan=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:mining/lush_hour=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:mining/a_shiny_treat=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={minecraft:husbandry/wax_off=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={minecraft:adventure/lightning_rod_with_villager_no_fire=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:mining/pixel_perfect=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:mining/strike_a_light=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:mining/bonfire_night=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:mining/called_shot=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:mining/bulldozer=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:mining/mr_bean=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:building/setting_up_the_mood=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:building/the_ritual_begins=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:building/happy_birthday=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:building/pane_in_the_glass=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:building/hot_tub=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:building/rock_polish=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:building/deepslate_conspiracy=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:building/skyblock=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:farming/one_course_meal=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:farming/an_apple_a_day=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:farming/come_to_the_countryside=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:animal/goat_out_of_here=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:animal/billy_the_kid=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:animal/goat_simulator=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:animal/cephalight=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={minecraft:husbandry/make_a_sign_glow=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:animal/flashy_items=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:animal/iceologer_shouldve_won=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={minecraft:husbandry/axolotl_in_a_bucket=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:animal/axolittle=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:animal/axolotl_of_them=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:animal/axeolotl=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:animal/thanks_a_lotl=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:animal/humble_bundle=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:animal/fractal=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:animal/swine_sailing=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:animal/llama_festival=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:animal/so_hungry_i_could_eat_a_horse=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:animal/screaming_milk=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={minecraft:husbandry/ride_a_boat_with_a_goat=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={minecraft:husbandry/kill_axolotl_target=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={minecraft:adventure/spyglass_at_parrot=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:biomes/this_snow_is_snowier=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:biomes/powder_full=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:biomes/pandamonium=true}] run scoreboard players add @s bac_advancements 1
#execute as @a[advancements={blazeandcave:biomes/edge_of_the_jungle=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={minecraft:adventure/walk_on_powder_snow_with_leather_boots=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:biomes/boatception=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:biomes/smooth_operator=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:mining/this_dirt_is_dirtier=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:mining/leaflet_drop=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:adventure/buy_low_sell_high=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:adventure/justice=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:adventure/rare_candy_shop=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:adventure/hey_you_two_should_kiss=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:monsters/poultry_boy=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:monsters/basketblock_championship=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:monsters/pupil_poppers=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:weaponry/its_time_consuming=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:weaponry/inspector_gadget=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:weaponry/rock_paper_shears=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:weaponry/backfire=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:redstone/take_notes=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:redstone/noteworthy=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:redstone/travelling_bard=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:redstone/vibe_check=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:enchanting/over_overkill=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:statistics/the_haggler=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:statistics/big_spender=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:statistics/stonks=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:nether/ancient_restoration=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:nether/hot_spring=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:nether/polar_opposites=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:nether/jenga=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:nether/instant_mining=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:nether/master_netherite_miner=true}] run scoreboard players add @s bac_advancements 1
#execute as @a[advancements={blazeandcave:nether/netherite_mad_lad=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:nether/beacon_overlord=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={minecraft:adventure/spyglass_at_ghast=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:nether/a_piglins_best_friend=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:potion/gas_bomb=true}] run scoreboard players add @s bac_advancements 1
#execute as @a[advancements={blazeandcave:end/good_luck_getting_this_one=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={minecraft:adventure/spyglass_at_dragon=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:challenges/the_perfect_run=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:challenges/telescopic=true}] run scoreboard players add @s bac_advancements 1

# The following advancements were added in version 1.13
execute as @a[advancements={blazeandcave:mining/dripstone_drop=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:mining/lucky_break=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={minecraft:adventure/fall_from_world_height=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:mining/bottom_to_top=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:building/a_good_start=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:farming/squid_game=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:animal/blackberry_market=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:biomes/were_going_on_a_bear_hunt=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:biomes/dive_bomb=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:biomes/captain_america=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:adventure/map_room=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:adventure/sound_the_alarm=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={minecraft:adventure/play_jukebox_in_meadows=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:redstone/click=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:redstone/leveraging_synergy=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:redstone/on_a_rail=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:enchanting/baron_of_blacksmiths=true}] run scoreboard players add @s bac_advancements 1
#execute as @a[advancements={blazeandcave:statistics/65_hours_of_walking=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={minecraft:nether/ride_strider_in_overworld_lava=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:nether/gilded_miner=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:nether/astrobrute=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:nether/ludicrous_speed=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:potion/stealth_takedown=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:end/dogfight=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:challenges/riddle_me_this=true}] run scoreboard players add @s bac_advancements 1

# The following advancements were added in the Terralith version for 1.13.X. When running normal BACAP, these commands won't do anything
execute if score terralith_score bac_settings matches 1 as @a[advancements={blazeandcave:biomes/one_small_steppe_for_man=true}] run scoreboard players add @s bac_advancements 1
execute if score terralith_score bac_settings matches 1 as @a[advancements={blazeandcave:biomes/o_land_o_bloom=true}] run scoreboard players add @s bac_advancements 1
execute if score terralith_score bac_settings matches 1 as @a[advancements={blazeandcave:biomes/over_the_moon=true}] run scoreboard players add @s bac_advancements 1
execute if score terralith_score bac_settings matches 1 as @a[advancements={blazeandcave:biomes/smarter_than_the_average_bear=true}] run scoreboard players add @s bac_advancements 1
execute if score terralith_score bac_settings matches 1 as @a[advancements={blazeandcave:biomes/choco_mountain=true}] run scoreboard players add @s bac_advancements 1
execute if score terralith_score bac_settings matches 1 as @a[advancements={blazeandcave:biomes/the_world_is_your_canvas=true}] run scoreboard players add @s bac_advancements 1
execute if score terralith_score bac_settings matches 1 as @a[advancements={blazeandcave:biomes/eruption_in_the_air=true}] run scoreboard players add @s bac_advancements 1
execute if score terralith_score bac_settings matches 1 as @a[advancements={blazeandcave:biomes/skylanders=true}] run scoreboard players add @s bac_advancements 1
execute if score terralith_score bac_settings matches 1 as @a[advancements={blazeandcave:biomes/aesthetic=true}] run scoreboard players add @s bac_advancements 1
execute if score terralith_score bac_settings matches 1 as @a[advancements={blazeandcave:biomes/alpha_days=true}] run scoreboard players add @s bac_advancements 1
execute if score terralith_score bac_settings matches 1 as @a[advancements={blazeandcave:biomes/the_boreal_deal=true}] run scoreboard players add @s bac_advancements 1
execute if score terralith_score bac_settings matches 1 as @a[advancements={blazeandcave:biomes/a_grassy_nature=true}] run scoreboard players add @s bac_advancements 1
execute if score terralith_score bac_settings matches 1 as @a[advancements={blazeandcave:biomes/highlander=true}] run scoreboard players add @s bac_advancements 1
execute if score terralith_score bac_settings matches 1 as @a[advancements={blazeandcave:biomes/bushranger=true}] run scoreboard players add @s bac_advancements 1
execute if score terralith_score bac_settings matches 1 as @a[advancements={blazeandcave:biomes/a_cliffhanger=true}] run scoreboard players add @s bac_advancements 1
execute if score terralith_score bac_settings matches 1 as @a[advancements={blazeandcave:biomes/pretty_in_purple=true}] run scoreboard players add @s bac_advancements 1
execute if score terralith_score bac_settings matches 1 as @a[advancements={blazeandcave:biomes/master_spelunker=true}] run scoreboard players add @s bac_advancements 1
execute if score terralith_score bac_settings matches 1 as @a[advancements={blazeandcave:biomes/terralithic=true}] run scoreboard players add @s bac_advancements 1

execute if score terralith_score bac_settings matches 1 as @a[advancements={blazeandcave:biomes/land_of_icicles=true}] run scoreboard players add @s bac_advancements 1
execute if score terralith_score bac_settings matches 1 as @a[advancements={blazeandcave:adventure/castle_of_hrrms=true}] run scoreboard players add @s bac_advancements 1
execute if score terralith_score bac_settings matches 1 as @a[advancements={blazeandcave:adventure/remote_shelter=true}] run scoreboard players add @s bac_advancements 1
execute if score terralith_score bac_settings matches 1 as @a[advancements={blazeandcave:adventure/spire_of_ice=true}] run scoreboard players add @s bac_advancements 1
execute if score terralith_score bac_settings matches 1 as @a[advancements={blazeandcave:adventure/under_the_ice=true}] run scoreboard players add @s bac_advancements 1
#execute if score terralith_score bac_settings matches 1 as @a[advancements={blazeandcave:adventure/a_journey_begins=true}] run scoreboard players add @s bac_advancements 1
#execute if score terralith_score bac_settings matches 1 as @a[advancements={blazeandcave:adventure/expedition_of_discovery=true}] run scoreboard players add @s bac_advancements 1

# The following advancements were added in version 1.14
execute as @a[advancements={minecraft:adventure/avoid_vibration=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={minecraft:adventure/kill_mob_near_sculk_catalyst=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:mining/shriek_forever_after=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:redstone/the_block_of_eternal_screaming=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:redstone/cataclyst=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:redstone/monstrous_sacrifices=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:redstone/the_incredible_sculk=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:redstone/sculker_box=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:mining/fallen_kingdom=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:mining/frigid_diversions=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:mining/death_pointer=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:mining/9_to_5=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:mining/echonomy=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:mining/blind_as_a_bat=true}] run scoreboard players add @s bac_advancements 1

execute as @a[advancements={blazeandcave:building/stuck_in_the_mud=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:building/elmer_mudd=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:building/mangrove_master=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={minecraft:husbandry/froglights=true}] run scoreboard players add @s bac_advancements 1

execute as @a[advancements={blazeandcave:farming/a_mangrove_grove=true}] run scoreboard players add @s bac_advancements 1

execute as @a[advancements={blazeandcave:animal/frog_family=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={minecraft:husbandry/tadpole_in_a_bucket=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={minecraft:husbandry/leash_all_frog_variants=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:animal/ram=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:animal/loud_and_proud=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:animal/battle_of_the_bands=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:animal/caprymphony=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:animal/animal_kingdom=true}] run scoreboard players add @s bac_advancements 1

execute as @a[advancements={blazeandcave:biomes/cargo_carrier=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:biomes/flipper=true}] run scoreboard players add @s bac_advancements 1

execute as @a[advancements={blazeandcave:adventure/undying_fandom=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:adventure/allayance=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={minecraft:husbandry/allay_deliver_item_to_player=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:adventure/evelyn_evergreen=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:adventure/budget_vex=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:adventure/diagon_allay=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={minecraft:husbandry/allay_deliver_cake_to_note_block=true}] run scoreboard players add @s bac_advancements 1
#execute as @a[advancements={blazeandcave:adventure/awards_ceremony=true}] run scoreboard players add @s bac_advancements 1

execute as @a[advancements={blazeandcave:monsters/now_thats_a_lot_of_damage=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:monsters/blind_stare=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:monsters/stealth_is_optional=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:monsters/warden_frostbite=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:monsters/not_afraid_of_heights=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:monsters/house_of_freaks=true}] run scoreboard players add @s bac_advancements 1

execute as @a[advancements={blazeandcave:enchanting/like_a_ninja=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:enchanting/silent_but_deadly=true}] run scoreboard players add @s bac_advancements 1

execute as @a[advancements={blazeandcave:nether/hung_drawn_and_bartered=true}] run scoreboard players add @s bac_advancements 1

execute as @a[advancements={blazeandcave:end/the_void_frogs=true}] run scoreboard players add @s bac_advancements 1

#execute as @a[advancements={blazeandcave:challenges/farlander=true}] run scoreboard players add @s bac_advancements 1

# The following advancements were added in version 1.15
execute as @a[advancements={blazeandcave:adventure/nerds_never_die=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:adventure/and_make_it_double=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:building/living_dummy=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:building/built_on_sand_set_in_stone=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:farming/hot_chocolate=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:animal/silence_of_the_lambs=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:animal/its_high_noon=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:weaponry/spleaf=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:weaponry/there_it_goes=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:end/unending_hell=true}] run scoreboard players add @s bac_advancements 1

execute if score terralith_score bac_settings matches 1 as @a[advancements={blazeandcave:adventure/totally_not_terraria=true}] run scoreboard players add @s bac_advancements 1

# The following advancements were added in version 1.16
execute as @a[advancements={blazeandcave:redstone/calibration_sensation=true}] run scoreboard players add @s bac_advancements 1

execute as @a[advancements={blazeandcave:building/hanging_around=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:building/sign_off=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:building/shelf_expression=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:building/bamboozled=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:building/cherry_bomb=true}] run scoreboard players add @s bac_advancements 1

execute as @a[advancements={blazeandcave:animal/desert_rider=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:animal/hump_day=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:animal/the_high_road=true}] run scoreboard players add @s bac_advancements 1

execute as @a[advancements={blazeandcave:biomes/pretty_in_pink=true}] run scoreboard players add @s bac_advancements 1

execute as @a[advancements={blazeandcave:adventure/brushed_away=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={minecraft:adventure/salvage_sherd=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={minecraft:adventure/craft_decorated_pot_using_only_sherds=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:adventure/pottery_exhibition=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={minecraft:husbandry/obtain_sniffer_egg=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:adventure/truffle_worm=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:adventure/jurassic_sniff=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:adventure/happy_trails=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:adventure/raiders_of_the_lost_trim=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:adventure/good_lookin_treasure=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={minecraft:adventure/trim_with_any_armor_pattern=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:adventure/mold_maker=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:adventure/coordinated_flair=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:adventure/chromatic_armory=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:adventure/genesis_of_the_end=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:adventure/vexingly_hard_to_find=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:adventure/the_sound_of_silence=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={minecraft:adventure/trim_with_all_exclusive_armor_patterns=true}] run scoreboard players add @s bac_advancements 1
#execute as @a[advancements={blazeandcave:adventure/stacked_smither=true}] run scoreboard players add @s bac_advancements 1

execute as @a[advancements={blazeandcave:monsters/maximum_resistance=true}] run scoreboard players add @s bac_advancements 1

execute as @a[advancements={blazeandcave:redstone/monstrous_music=true}] run scoreboard players add @s bac_advancements 1

execute as @a[advancements={blazeandcave:statistics/om_nom_nom=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:statistics/yum_yum_yummo=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:statistics/food_glorious_food=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:statistics/loot_em=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:statistics/more_for_me=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:statistics/i_heart_chests=true}] run scoreboard players add @s bac_advancements 1
#execute as @a[advancements={blazeandcave:statistics/giga_xp_grinder=true}] run scoreboard players add @s bac_advancements 1

execute as @a[advancements={blazeandcave:nether/time_to_upgrade=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:nether/piglin_peril=true}] run scoreboard players add @s bac_advancements 1

execute as @a[advancements={blazeandcave:challenges/poglin=true}] run scoreboard players add @s bac_advancements 1

execute as @a[advancements={blazeandcave:adventure/a_chiptune_relic=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={minecraft:husbandry/feed_snifflet=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={minecraft:husbandry/plant_any_sniffer_seed=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={minecraft:adventure/read_power_of_chiseled_bookshelf=true}] run scoreboard players add @s bac_advancements 1

# The singular Nullscape advancement (added by Nullscape itself, not by me)
execute if score terralith_score bac_settings matches 1 as @a[advancements={nullscape:root=true}] run scoreboard players add @s bac_advancements 1


# The following advancements were added in version 1.16.8
execute as @a[advancements={minecraft:adventure/brush_armadillo=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={minecraft:husbandry/repair_wolf_armor=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={minecraft:husbandry/remove_wolf_armor=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={minecraft:husbandry/whole_pack=true}] run scoreboard players add @s bac_advancements 1


# The following advancements were added in version 1.17
execute as @a[advancements={blazeandcave:mining/grate_expectations=true}] run scoreboard players add @s bac_advancements 1

execute as @a[advancements={blazeandcave:building/bulbous=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={minecraft:adventure/lighten_up=true}] run scoreboard players add @s bac_advancements 1

execute as @a[advancements={blazeandcave:animal/farmadillo=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:animal/armadoggo=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:animal/paw_patrol=true}] run scoreboard players add @s bac_advancements 1

execute as @a[advancements={minecraft:adventure/minecraft_trials_edition=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:adventure/this_will_be_a_breeze=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:adventure/break_wind=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={minecraft:adventure/who_needs_rockets=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:adventure/breeze_suppressor=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:adventure/from_under_your_feet=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={minecraft:adventure/blowback=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={minecraft:adventure/under_lock_and_key=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:adventure/hard_mode_activated=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={minecraft:adventure/revaulting=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:adventure/vault_hunter=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:adventure/keys_to_success=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:adventure/tricky_treasures=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:adventure/omniscient=true}] run scoreboard players add @s bac_advancements 1
#execute as @a[advancements={blazeandcave:adventure/core_keeper=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:adventure/a_suspicious_advancement=true}] run scoreboard players add @s bac_advancements 1
#execute as @a[advancements={blazeandcave:adventure/sus=true}] run scoreboard players add @s bac_advancements 1

execute as @a[advancements={blazeandcave:monsters/bogged_down=true}] run scoreboard players add @s bac_advancements 1

execute as @a[advancements={blazeandcave:weaponry/nice_to_mace_you=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={minecraft:adventure/overoverkill=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:weaponry/warden_extinction=true}] run scoreboard players add @s bac_advancements 1

execute as @a[advancements={blazeandcave:redstone/craftception=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={minecraft:adventure/crafters_crafting_crafters=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:redstone/factorio=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:redstone/we_have_liftoff=true}] run scoreboard players add @s bac_advancements 1

execute as @a[advancements={blazeandcave:enchanting/mace_windu=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:enchanting/whack_a_mole=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:enchanting/master_macerator=true}] run scoreboard players add @s bac_advancements 1

execute as @a[advancements={blazeandcave:potion/imbued_projectiles=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:potion/secret_of_the_ooze=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:potion/final_shout=true}] run scoreboard players add @s bac_advancements 1

execute as @a[advancements={blazeandcave:end/divers_dozen=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:end/dimension_penetration=true}] run scoreboard players add @s bac_advancements 1

execute as @a[advancements={blazeandcave:challenges/overwarden=true}] run scoreboard players add @s bac_advancements 1


# The following advancements were added in version 1.18
execute as @a[advancements={blazeandcave:biomes/eyeball_forest=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:biomes/heart_breaker=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:biomes/pale_in_comparison=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:biomes/resinance=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:biomes/fake_copper=true}] run scoreboard players add @s bac_advancements 1

execute as @a[advancements={blazeandcave:building/pale_gardener=true}] run scoreboard players add @s bac_advancements 1

execute as @a[advancements={blazeandcave:animal/flamboyant_range=true}] run scoreboard players add @s bac_advancements 1

execute as @a[advancements={blazeandcave:nether/light_show=true}] run scoreboard players add @s bac_advancements 1

execute as @a[advancements={blazeandcave:mining/i_yearned_for_the_mines=true}] run scoreboard players add @s bac_advancements 1


# The following advancements were added in version 1.19
execute as @a[advancements={blazeandcave:farming/booshes=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:farming/you_cant_take_the_sky_from_me=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:farming/certified_spud_chomper=true}] run scoreboard players add @s bac_advancements 1

execute as @a[advancements={blazeandcave:animal/piglets_big_advancement=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:animal/the_three_little_pigs=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:animal/beef_moover=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:animal/omelette=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:animal/chick_buffet=true}] run scoreboard players add @s bac_advancements 1

execute as @a[advancements={minecraft:adventure/heart_transplanter=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:biomes/le_creak_cest_chic=true}] run scoreboard players add @s bac_advancements 1

execute as @a[advancements={blazeandcave:adventure/all_around_the_world=true}] run scoreboard players add @s bac_advancements 1

execute as @a[advancements={blazeandcave:monsters/look_out=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:monsters/absolute_cinema=true}] run scoreboard players add @s bac_advancements 1

execute as @a[advancements={blazeandcave:redstone/splatfest=true}] run scoreboard players add @s bac_advancements 1

execute as @a[advancements={blazeandcave:enchanting/oh_baby_a_triple=true}] run scoreboard players add @s bac_advancements 1

execute as @a[advancements={blazeandcave:statistics/test_flight=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:statistics/who_needs_elytra=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:statistics/big_blimp_enthusiast=true}] run scoreboard players add @s bac_advancements 1

execute as @a[advancements={minecraft:husbandry/place_dried_ghast_in_water=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:nether/snow_cone=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:nether/hot_air_balloon=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:nether/midport_village=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:nether/lead_zeppelin=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:nether/pillow_fight=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:nether/collateral_damage=true}] run scoreboard players add @s bac_advancements 1

execute as @a[advancements={blazeandcave:potion/string_shot=true}] run scoreboard players add @s bac_advancements 1

execute as @a[advancements={blazeandcave:end/why_do_i_hear_boss_music=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:end/unstoppable_force_vs_immovable_object=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:end/youre_doing_it_wrong=true}] run scoreboard players add @s bac_advancements 1

execute as @a[advancements={blazeandcave:challenges/at_the_rim_of_the_sky=true}] run scoreboard players add @s bac_advancements 1
execute as @a[advancements={blazeandcave:challenges/lets_take_it_up_a_notch=true}] run scoreboard players add @s bac_advancements 1




# Updates team scores
function bacap_rewards:team_score


# Updates number format (colours)
function blazeandcave:config/update_number_format














