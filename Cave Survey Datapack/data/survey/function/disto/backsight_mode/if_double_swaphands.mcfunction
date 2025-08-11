# update timers
execute if score @s disto_swaphands_timer matches 1..5 run scoreboard players remove @s disto_swaphands_timer 1
execute if score @s disto_change_backsight_mode_timer matches 1..10 run scoreboard players remove @s disto_change_backsight_mode_timer 1

# remove slot tag if not holding disto
execute unless items entity @s weapon.* minecraft:music_disc_lava_chicken[custom_data~{disto:1b}] run tag @s remove disto_mainhand
execute unless items entity @s weapon.* minecraft:music_disc_lava_chicken[custom_data~{disto:1b}] run tag @s remove disto_offhand

# return false if player not holding disto
execute unless items entity @s weapon.* minecraft:music_disc_lava_chicken[custom_data~{disto:1b}] run return 0
# return false if player holding disto in both hands
execute if items entity @s weapon.mainhand minecraft:music_disc_lava_chicken[custom_data~{disto:1b}] if items entity @s weapon.offhand minecraft:music_disc_lava_chicken[custom_data~{disto:1b}] run return 0

# store item data in storage path
execute store result storage survey:data disto.backsight_mode.new_mode byte 1 if items entity @s weapon.* minecraft:music_disc_lava_chicken[minecraft:custom_data~{backsight_mode:0b}]
execute if items entity @s weapon.mainhand minecraft:music_disc_lava_chicken[minecraft:custom_data~{disto:1b}] run data modify storage survey:data disto.backsight_mode.slot set value "mainhand"
execute if items entity @s weapon.offhand minecraft:music_disc_lava_chicken[minecraft:custom_data~{disto:1b}] run data modify storage survey:data disto.backsight_mode.slot set value "offhand"
execute if items entity @s weapon.mainhand minecraft:music_disc_lava_chicken[minecraft:custom_data~{disto:1b}] run data modify storage survey:data disto.backsight_mode.disto_id set from entity @s SelectedItem.components."minecraft:custom_data".disto_id
execute if items entity @s weapon.offhand minecraft:music_disc_lava_chicken[minecraft:custom_data~{disto:1b}] run data modify storage survey:data disto.backsight_mode.disto_id set from entity @s equipment.offhand.components."minecraft:custom_data".disto_id

# start 5 tick swaphands timer if player swaps hands (1st time)
execute if entity @s[tag=disto_mainhand] if items entity @s weapon.offhand minecraft:music_disc_lava_chicken[minecraft:custom_data~{disto:1b}] if score @s disto_swaphands_timer matches 0 run scoreboard players set @s disto_swaphands_timer 5
execute if entity @s[tag=disto_offhand] if items entity @s weapon.mainhand minecraft:music_disc_lava_chicken[minecraft:custom_data~{disto:1b}] if score @s disto_swaphands_timer matches 0 run scoreboard players set @s disto_swaphands_timer 5

# return true if player swaps hands within 5 ticks (2nd time)
execute if entity @s[tag=disto_mainhand] if items entity @s weapon.offhand minecraft:music_disc_lava_chicken[minecraft:custom_data~{disto:1b}] if score @s disto_swaphands_timer matches 1..4 if score @s disto_change_backsight_mode_timer matches 0 run return 1
execute if entity @s[tag=disto_offhand] if items entity @s weapon.mainhand minecraft:music_disc_lava_chicken[minecraft:custom_data~{disto:1b}] if score @s disto_swaphands_timer matches 1..4 if score @s disto_change_backsight_mode_timer matches 0 run return 1

# restart 10 tick change backsight mode timer if player attempts to double swaphands again within 10 ticks
execute if entity @s[tag=disto_mainhand] if items entity @s weapon.offhand minecraft:music_disc_lava_chicken[minecraft:custom_data~{disto:1b}] if score @s disto_swaphands_timer matches 1..4 run scoreboard players set @s disto_change_backsight_mode_timer 10
execute if entity @s[tag=disto_offhand] if items entity @s weapon.mainhand minecraft:music_disc_lava_chicken[minecraft:custom_data~{disto:1b}] if score @s disto_swaphands_timer matches 1..4 run scoreboard players set @s disto_change_backsight_mode_timer 10

# update disto slot tag
tag @s remove disto_mainhand
tag @s remove disto_offhand
execute if items entity @s weapon.mainhand minecraft:music_disc_lava_chicken[minecraft:custom_data~{disto:1b}] run tag @s add disto_mainhand
execute if items entity @s weapon.offhand minecraft:music_disc_lava_chicken[minecraft:custom_data~{disto:1b}] run tag @s add disto_offhand

# else - return false
return 0