# remove headlamp flood light
execute at @e[tag=survey.headlamp.light_pos,tag=survey.headlamp.flood,type=marker] run fill ~-1 ~-1 ~-1 ~1 ~1 ~1 air replace light[level=15] strict
# remove headlamp spot light
execute at @e[tag=survey.headlamp.light_pos,tag=survey.headlamp.spot,type=marker] run fill ~-2 ~-2 ~-2 ~2 ~2 ~2 air replace light[level=15] strict
# remove headlamp light markers
kill @e[tag=survey.headlamp.light_pos,type=marker]