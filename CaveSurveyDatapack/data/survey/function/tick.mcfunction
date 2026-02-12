## from #minecraft:tick

# remove headlamp light from previous tick
execute at @a run function survey:headlamp/use/remove_light

# loop function for each player
execute as @a run function survey:loop_1t