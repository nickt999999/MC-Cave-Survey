# rough forwards direction raycast from origin position
scoreboard players set #survey survey.disto.raycast_steps 0
execute if data storage survey:data {disto:{shot:{origin:"center"}}} positioned ~ ~0.9 ~ facing entity @e[tag=survey.disto.target_pos,type=marker,distance=..260] eyes run function survey:disto/use/raycast/raycast_forwards_intended_origin_loop
execute if data storage survey:data {disto:{shot:{origin:"witeout"}}} positioned ~ ~0.61 ~ if entity @s[dy=0] positioned ~ ~0.29 ~ at @e[tag=survey.witeout.entity,distance=..1.5,sort=nearest,limit=1,type=block_display] facing entity @e[tag=survey.disto.target_pos,type=marker,distance=..260] eyes run function survey:disto/use/raycast/raycast_forwards_intended_origin_loop
execute if data storage survey:data {disto:{shot:{origin:"witeout"}}} positioned ~ ~0.61 ~ unless entity @s[dy=0] at @s anchored eyes positioned ^ ^ ^ at @e[tag=survey.witeout.entity,distance=..1.5,sort=nearest,limit=1,type=block_display] facing entity @e[tag=survey.disto.target_pos,type=marker,distance=..260] eyes run function survey:disto/use/raycast/raycast_forwards_intended_origin_loop
# get forwards raycast steps for distance calculation
scoreboard players operation #survey survey.disto.intended_origin_forwards_raycast_steps = #survey survey.disto.raycast_steps
# precise backwards direction raycast
scoreboard players set #survey survey.disto.raycast_steps 0
execute unless data storage survey:data {shot:{raycast:{result:"shot_intersect"}}} at @e[tag=survey.disto.raycast_target_pos,type=marker,distance=..260] positioned ^ ^ ^0.1 run function survey:disto/use/raycast/raycast_backwards_intended_origin_loop
# spawn target position marker
execute at @e[tag=survey.disto.raycast_target_pos,type=marker,distance=..260] run summon marker ~ ~ ~ {Tags:["survey.disto.intended_target_pos","survey"]}