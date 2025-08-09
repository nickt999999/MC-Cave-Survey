# reset advancement
advancement revoke @s only survey:click_witeout

# prevent if within cooldown
execute if score @s witeout_cooldown_gametime matches 0.. run return 0

# else - use witeout
execute if items entity @s weapon.mainhand minecraft:music_disc_lava_chicken[minecraft:custom_data~{witeout:1b}] run data modify storage survey:data witeout.slot set value "mainhand"
execute if items entity @s weapon.offhand minecraft:music_disc_lava_chicken[minecraft:custom_data~{witeout:1b}] unless items entity @s weapon.mainhand minecraft:music_disc_lava_chicken[minecraft:custom_data~{witeout:1b}] run data modify storage survey:data witeout.slot set value "offhand"
execute at @s run function survey:witeout/use/use_witeout

# else - schedule 5 tick cooldown (temp remove?)
execute store result score @s witeout_cooldown_gametime run time query gametime
scoreboard players add @s witeout_cooldown_gametime 5
schedule function survey:witeout/use/disable_cooldown 5t append