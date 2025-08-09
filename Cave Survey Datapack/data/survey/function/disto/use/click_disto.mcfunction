# reset advancement
advancement revoke @s only survey:click_disto

# prevent if within cooldown
execute if score @s disto_cooldown_gametime matches 0.. run return 0

# else - take disto shot
execute if items entity @s weapon.mainhand minecraft:music_disc_lava_chicken[minecraft:custom_data~{disto:1b}] run data modify storage survey:data disto.shot.disto_id set from entity @s SelectedItem.components."minecraft:custom_data"."disto_id"
execute if items entity @s weapon.offhand minecraft:music_disc_lava_chicken[minecraft:custom_data~{disto:1b}] unless items entity @s weapon.mainhand minecraft:music_disc_lava_chicken[minecraft:custom_data~{disto:1b}] run data modify storage survey:data disto.shot.disto_id set from entity @s equipment.offhand.components."minecraft:custom_data"."disto_id"
execute at @s run function survey:disto/use/take_shot

# else - schedule 20 tick cooldown
execute store result score @s disto_cooldown_gametime run time query gametime
scoreboard players add @s disto_cooldown_gametime 20
schedule function survey:disto/use/disable_cooldown 20t append