# place z line of blocks
$execute positioned ~ ~ ~-$(light_size) run function survey:headlamp/place_light/place_z_loop
# update counter
scoreboard players remove #survey place_light_counter_y 1
# loop until counter is 0
$execute if score #survey place_light_counter_y matches 1.. positioned ~ ~1 ~ run function survey:headlamp/place_light/place_yz_loop {light_size:$(light_size)}
# reset counter
scoreboard players add #survey place_light_counter_y 1