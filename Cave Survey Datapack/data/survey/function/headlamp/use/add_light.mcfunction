# place flood light at position from 5m range raycast
tag @s add self
scoreboard players set #survey headlamp_raycast_steps 0
execute anchored eyes positioned ^ ^ ^ run function survey:headlamp/raycast/raycast_flood_loop
execute at @e[tag=headlamp_target_pos,type=marker,distance=..100] run summon marker ~ ~ ~ {Tags:["light_pos","flood","survey_datapack"]}
execute at @e[tag=headlamp_target_pos,type=marker,distance=..100] run fill ~-1 ~-1 ~-1 ~1 ~1 ~1 minecraft:light[level=15] replace #minecraft:air strict

# place spot light at position from 75m range raycast
scoreboard players set #survey headlamp_raycast_steps 0
execute anchored eyes positioned ^ ^ ^ run function survey:headlamp/raycast/raycast_spot_loop
execute at @e[tag=headlamp_target_pos,type=marker,distance=..100] run summon marker ~ ~ ~ {Tags:["light_pos","spot","survey_datapack"]}
execute at @e[tag=headlamp_target_pos,type=marker,distance=..100] run fill ~-2 ~-2 ~-2 ~2 ~2 ~2 minecraft:light[level=15] replace #minecraft:air strict

# remove raycast tag and marker
tag @s remove self
kill @e[tag=headlamp_target_pos,type=marker,distance=..100]