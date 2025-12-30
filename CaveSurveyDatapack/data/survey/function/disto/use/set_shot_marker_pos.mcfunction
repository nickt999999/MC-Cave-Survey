# align shot target marker position
execute at @e[tag=survey.disto.target_pos,type=marker,distance=..260] run function survey:disto/use/align_pos
tp @e[tag=survey.disto.target_pos,type=marker,distance=..260] @e[tag=survey.disto.align_pos,limit=1,type=marker,distance=..260]

# spawn shot origin marker
execute if data storage survey:data {disto:{shot:{origin:"center"}}} run summon marker ~ ~0.9 ~ {Tags:["survey.disto.origin_pos","survey"]}
execute if data storage survey:data {disto:{shot:{origin:"eyes"}}} anchored eyes run summon marker ^ ^ ^ {Tags:["survey.disto.origin_pos","survey"]}
execute if data storage survey:data {disto:{shot:{origin:"witeout"}}} positioned ~ ~0.61 ~ if entity @s[dy=0] positioned ~ ~0.29 ~ at @e[tag=survey.witeout.entity,distance=..1.5,sort=nearest,limit=1,type=block_display] run summon marker ~ ~ ~ {Tags:["survey.disto.origin_pos","survey"]}
execute if data storage survey:data {disto:{shot:{origin:"witeout"}}} positioned ~ ~0.61 ~ unless entity @s[dy=0] at @s anchored eyes positioned ^ ^ ^ at @e[tag=survey.witeout.entity,distance=..1.5,sort=nearest,limit=1,type=block_display] run summon marker ~ ~ ~ {Tags:["survey.disto.origin_pos","survey"]}
# align shot origin marker position
execute at @e[tag=survey.disto.origin_pos] run function survey:disto/use/align_pos
execute at @e[tag=survey.disto.align_pos,type=marker,distance=..4] run tp @e[tag=survey.disto.origin_pos,type=marker,distance=..0.1] ~ ~ ~ facing entity @e[tag=survey.disto.target_pos,limit=1,type=marker,distance=..260]