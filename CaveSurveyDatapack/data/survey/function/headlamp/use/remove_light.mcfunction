# remove headlamp survey.headlamp.flood light
execute at @e[tag=survey.headlamp.light_pos,tag=survey.headlamp.flood,type=marker,distance=..100] run fill ~-1 ~-1 ~-1 ~1 ~1 ~1 minecraft:air replace minecraft:light[level=15] strict
# remove headlamp spot light
execute at @e[tag=survey.headlamp.light_pos,tag=survey.headlamp.spot,type=marker,distance=..100] run fill ~-2 ~-2 ~-2 ~2 ~2 ~2 minecraft:air replace minecraft:light[level=15] strict
# remove headlamp light markers
kill @e[tag=survey.headlamp.light_pos,type=marker,distance=..100]