# remove headlamp flood light
execute at @e[tag=light_pos,tag=flood,type=marker] run fill ~-1 ~-1 ~-1 ~1 ~1 ~1 air replace light[level=15] strict
# remove headlamp spot light
execute at @e[tag=light_pos,tag=spot,type=marker] run fill ~-2 ~-2 ~-2 ~2 ~2 ~2 air replace light[level=15] strict
# remove headlamp light markers
kill @e[tag=light_pos,type=marker]