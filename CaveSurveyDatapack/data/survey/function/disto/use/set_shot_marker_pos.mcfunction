# align shot target marker position
execute at @e[tag=disto_target_pos] run function survey:disto/use/align_pos
tp @e[tag=disto_target_pos] @e[tag=align_pos,limit=1]

# spawn shot origin marker
execute if data storage survey:data {disto:{shot:{origin:"center"}}} run summon marker ~ ~0.9 ~ {Tags:["disto_origin_pos","survey_datapack"]}
execute if data storage survey:data {disto:{shot:{origin:"eyes"}}} anchored eyes run summon marker ^ ^ ^ {Tags:["disto_origin_pos","survey_datapack"]}
execute if data storage survey:data {disto:{shot:{origin:"witeout"}}} positioned ~ ~0.61 ~ if entity @s[dy=0] positioned ~ ~0.29 ~ at @e[tag=witeout_blot,distance=..1.5,sort=nearest,limit=1,type=block_display] run summon marker ~ ~ ~ {Tags:["disto_origin_pos","survey_datapack"]}
execute if data storage survey:data {disto:{shot:{origin:"witeout"}}} positioned ~ ~0.61 ~ unless entity @s[dy=0] at @s anchored eyes positioned ^ ^ ^ at @e[tag=witeout_blot,distance=..1.5,sort=nearest,limit=1,type=block_display] run summon marker ~ ~ ~ {Tags:["disto_origin_pos","survey_datapack"]}
# align shot origin marker position
execute at @e[tag=disto_origin_pos] run function survey:disto/use/align_pos
execute at @e[tag=align_pos,type=marker,distance=..4] run tp @e[tag=disto_origin_pos,type=marker,distance=..0.1] ~ ~ ~ facing entity @e[tag=disto_target_pos,limit=1,type=marker,distance=..260]