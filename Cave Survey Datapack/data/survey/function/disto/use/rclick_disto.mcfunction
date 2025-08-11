# reset advancement
advancement revoke @s only survey:rclick_disto

# prevent use if holding rclick
tag @s add rclick_disto_tick
execute if entity @s[tag=rclick_disto_hold] run return 0
tag @s add rclick_disto_hold
# prevent use if within cooldown
execute if score @s disto_cooldown_gametime matches 0.. run return 0

# else - use item
execute if items entity @s weapon.mainhand minecraft:music_disc_lava_chicken[minecraft:custom_data~{disto:1b}] run data modify storage survey:data disto.shot.disto_id set from entity @s SelectedItem.components."minecraft:custom_data".disto_id
execute if items entity @s weapon.mainhand minecraft:music_disc_lava_chicken[minecraft:custom_data~{disto:1b}] run data modify storage survey:data disto.shot.backsight_mode set from entity @s SelectedItem.components."minecraft:custom_data".backsight_mode
execute if items entity @s weapon.offhand minecraft:music_disc_lava_chicken[minecraft:custom_data~{disto:1b}] unless items entity @s weapon.mainhand minecraft:music_disc_lava_chicken[minecraft:custom_data~{disto:1b}] run data modify storage survey:data disto.shot.disto_id set from entity @s equipment.offhand.components."minecraft:custom_data".disto_id
execute if items entity @s weapon.offhand minecraft:music_disc_lava_chicken[minecraft:custom_data~{disto:1b}] unless items entity @s weapon.mainhand minecraft:music_disc_lava_chicken[minecraft:custom_data~{disto:1b}] run data modify storage survey:data disto.shot.backsight_mode set from entity @s equipment.offhand.components."minecraft:custom_data".backsight_mode
execute at @s run function survey:disto/use/take_shot
# set 10 tick cooldown
execute store result score @s disto_cooldown_gametime run time query gametime
scoreboard players add @s disto_cooldown_gametime 10
schedule function survey:disto/use/disable_cooldown 10t append