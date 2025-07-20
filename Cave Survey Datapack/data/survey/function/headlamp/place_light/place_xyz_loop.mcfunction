# place yz plane of blocks
$execute positioned ~ ~-$(light_size) ~ run function survey:headlamp/place_light/place_yz_loop {light_size:$(light_size)}
# update counter
scoreboard players remove #survey place_light_counter_x 1
# loop until counter is 0
$execute if score #survey place_light_counter_x matches 1.. positioned ~1 ~ ~ run function survey:headlamp/place_light/place_xyz_loop {light_size:$(light_size)}
# reset counter
scoreboard players add #survey place_light_counter_x 1