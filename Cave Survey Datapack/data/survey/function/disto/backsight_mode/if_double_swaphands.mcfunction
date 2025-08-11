# TEMP check

# store item data in storage path
execute store result storage survey:data disto.backsight_mode.new_mode byte 1 if items entity @s weapon.* minecraft:music_disc_lava_chicken[minecraft:custom_data~{backsight_mode:0b}]
execute if items entity @s weapon.mainhand minecraft:music_disc_lava_chicken[minecraft:custom_data~{disto:1b}] run data modify storage survey:data disto.backsight_mode.slot set value "mainhand"
execute if items entity @s weapon.offhand minecraft:music_disc_lava_chicken[minecraft:custom_data~{disto:1b}] run data modify storage survey:data disto.backsight_mode.slot set value "offhand"
execute if items entity @s weapon.mainhand minecraft:music_disc_lava_chicken[minecraft:custom_data~{disto:1b}] run data modify storage survey:data disto.backsight_mode.disto_id set from entity @s SelectedItem.components."minecraft:custom_data".disto_id
execute if items entity @s weapon.offhand minecraft:music_disc_lava_chicken[minecraft:custom_data~{disto:1b}] run data modify storage survey:data disto.backsight_mode.disto_id set from entity @s equipment.offhand.components."minecraft:custom_data".disto_id

# start 5 tick timer if player swaps hands
execute if entity @s[tag=disto_mainhand] if items entity @s weapon.offhand minecraft:music_disc_lava_chicken[minecraft:custom_data~{disto:1b}] unless items entity @s weapon.mainhand minecraft:music_disc_lava_chicken[minecraft:custom_data~{disto:1b}] if score @s disto_swaphands_timer matches 0 run scoreboard players set @s disto_swaphands_timer 5
execute if entity @s[tag=disto_offhand] if items entity @s weapon.mainhand minecraft:music_disc_lava_chicken[minecraft:custom_data~{disto:1b}] unless items entity @s weapon.offhand minecraft:music_disc_lava_chicken[minecraft:custom_data~{disto:1b}] if score @s disto_swaphands_timer matches 0 run scoreboard players set @s disto_swaphands_timer 5
# return true if player swaps hands twice within 5 tick timer
execute if entity @s[tag=disto_mainhand] if items entity @s weapon.offhand minecraft:music_disc_lava_chicken[minecraft:custom_data~{disto:1b}] unless items entity @s weapon.mainhand minecraft:music_disc_lava_chicken[minecraft:custom_data~{disto:1b}] if score @s disto_swaphands_timer matches 1..4 run return 1
execute if entity @s[tag=disto_offhand] if items entity @s weapon.mainhand minecraft:music_disc_lava_chicken[minecraft:custom_data~{disto:1b}] unless items entity @s weapon.offhand minecraft:music_disc_lava_chicken[minecraft:custom_data~{disto:1b}] if score @s disto_swaphands_timer matches 1..4 run return 1

# update disto slot tag
tag @s remove disto_mainhand
tag @s remove disto_offhand
execute if items entity @s weapon.mainhand minecraft:music_disc_lava_chicken[minecraft:custom_data~{disto:1b}] run tag @s add disto_mainhand
execute if items entity @s weapon.offhand minecraft:music_disc_lava_chicken[minecraft:custom_data~{disto:1b}] run tag @s add disto_offhand

# else - return false
return 0