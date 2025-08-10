# remove headlamp flood light
execute at @e[tag=light_pos,tag=flood,type=marker,distance=..100] run fill ~-1 ~-1 ~-1 ~1 ~1 ~1 air replace light[level=15]
# remove headlamp spot light
execute at @e[tag=light_pos,tag=spot,type=marker,distance=..100] run fill ~-2 ~-2 ~-2 ~2 ~2 ~2 air replace light[level=15]
# remove headlamp light markers
kill @e[tag=light_pos,type=marker,distance=..100]