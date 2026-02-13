## from #minecraft:tick

# remove headlamp light from previous tick
execute at @a run function survey:headlamp/use/remove_light

# update player commands and items
execute as @a run function survey:update_player_1t