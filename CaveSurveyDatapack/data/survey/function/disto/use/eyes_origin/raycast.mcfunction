# get disto range
execute store result storage survey:data disto.shot.raycast.range int 1 run function survey:disto/use/eyes_origin/get_range
# rough forwards direction raycast
tag @s add survey.self
scoreboard players set #survey survey.disto.raycast_steps 0
function survey:disto/use/raycast/raycast_forwards_eyes_origin_loop
# get forwards raycast steps for distance calculation
scoreboard players operation #survey survey.disto.forwards_raycast_steps = #survey survey.disto.raycast_steps
# precise backwards direction raycast
scoreboard players set #survey survey.disto.raycast_steps 0
execute if data storage survey:data {disto:{shot:{raycast:{result:"block"}}}} at @e[tag=survey.disto.raycast_target_pos,type=marker,distance=..260] run function survey:disto/use/raycast/raycast_backwards_block_eyes_origin_loop
execute if data storage survey:data {disto:{shot:{raycast:{result:"entity"}}}} at @e[tag=survey.disto.raycast_target_pos,type=marker,distance=..260] run function survey:disto/use/raycast/raycast_backwards_entity_eyes_origin_loop
# get backwards raycast steps for distance calculation
scoreboard players operation #survey survey.disto.backwards_raycast_steps = #survey survey.disto.raycast_steps
# store shot in-range state in storage path
execute store result storage survey:data disto.shot.shot_in_range byte 1 unless data storage survey:data {disto:{shot:{raycast:{result:"range_limit"}}}}
# spawn target position marker
execute if data storage survey:data {disto:{shot:{shot_in_range:1b}}} at @e[tag=survey.disto.raycast_target_pos,type=marker,distance=..260] run summon marker ~ ~ ~ {Tags:["survey.disto.target_pos","survey"]}
execute if data storage survey:data {disto:{shot:{shot_in_range:0b}}} run function survey:disto/use/eyes_origin/set_out_of_range_target_pos with storage survey:data disto.shot.raycast