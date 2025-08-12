# revoke advancement
advancement revoke @s only survey:rclick_witeout

# prevent use if holding rclick
tag @s add rclick_witeout_tick
execute if entity @s[tag=rclick_witeout_hold] run return 0
tag @s add rclick_witeout_hold
# prevent use if within cooldown
execute if score @s survey.witeout.cooldown_gametime matches 0.. run return 0

# else - use item
execute if items entity @s weapon.mainhand minecraft:music_disc_lava_chicken[minecraft:custom_data~{witeout:1b}] run data modify storage survey:data witeout.slot set value "mainhand"
execute if items entity @s weapon.offhand minecraft:music_disc_lava_chicken[minecraft:custom_data~{witeout:1b}] unless items entity @s weapon.mainhand minecraft:music_disc_lava_chicken[minecraft:custom_data~{witeout:1b}] run data modify storage survey:data witeout.slot set value "offhand"
execute at @s run function survey:witeout/use/use_witeout
# set 10 tick cooldown
execute store result score @s survey.witeout.cooldown_gametime run time query gametime
scoreboard players add @s survey.witeout.cooldown_gametime 10
schedule function survey:witeout/use/disable_cooldown 10t append