# place block if position is empty and does not border update prevention tagged block
execute if function survey:headlamp/place_light/if_valid_pos run setblock ~ ~ ~ light[level=15]
# update counter
scoreboard players remove #survey place_light_counter_z 1
# loop until counter is 0
execute if score #survey place_light_counter_z matches 1.. positioned ~ ~ ~1 run function survey:headlamp/place_light/place_z_loop
# reset counter
scoreboard players add #survey place_light_counter_z 1