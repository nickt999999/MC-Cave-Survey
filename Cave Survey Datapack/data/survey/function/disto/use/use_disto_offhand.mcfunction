# reset advancement
advancement revoke @s only survey:use_disto_offhand

# prevent if within cooldown
execute if score @s disto_cooldown_gametime matches 0.. run return 0

# else - take disto shot
data modify storage survey:data disto.shot.slot set value "offhand"
data modify storage survey:data disto.shot.disto_id set from entity @s equipment.offhand.components."minecraft:custom_data"."disto_id"
execute at @s run function survey:disto/use/take_shot

# else - schedule 20 tick cooldown
execute store result score @s disto_cooldown_gametime run time query gametime
scoreboard players add @s disto_cooldown_gametime 20
schedule function survey:disto/use/disable_cooldown 20t append