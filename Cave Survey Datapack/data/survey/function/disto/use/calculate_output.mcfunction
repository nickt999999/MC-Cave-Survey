# get shot inclination and rotation
execute if data storage survey:data {disto:{shot:{backsight_mode:0b}}} store result score #survey survey.disto.inclination run data get entity @e[tag=disto_origin_pos,limit=1,type=marker,distance=..4] Rotation[1] -1000
execute if data storage survey:data {disto:{shot:{backsight_mode:1b}}} store result score #survey survey.disto.inclination run data get entity @e[tag=disto_origin_pos,limit=1,type=marker,distance=..4] Rotation[1] 1000
# calculate absolute value for floor rounding
scoreboard players operation #survey survey.disto.inclination_abs = #survey survey.disto.inclination
execute if score #survey survey.disto.inclination matches -2147483648..0 run scoreboard players operation #survey survey.disto.inclination_abs *= #survey survey.-1
# calculate inclination display objectives
scoreboard players operation #survey survey.disto.inclination_decimal_3 = #survey survey.disto.inclination_abs
scoreboard players operation #survey survey.disto.inclination_decimal_3 %= #survey survey.10
execute if score #survey survey.disto.inclination_decimal_3 matches 5..9 run scoreboard players add #survey survey.disto.inclination_abs 10
scoreboard players operation #survey survey.disto.inclination_whole = #survey survey.disto.inclination_abs 
scoreboard players operation #survey survey.disto.inclination_whole /= #survey survey.1000
execute if score #survey survey.disto.inclination matches -2147483648..0 run scoreboard players operation #survey survey.disto.inclination_whole *= #survey survey.-1
scoreboard players operation #survey survey.disto.inclination_decimal_1 = #survey survey.disto.inclination_abs 
scoreboard players operation #survey survey.disto.inclination_decimal_1 %= #survey survey.1000
scoreboard players operation #survey survey.disto.inclination_decimal_1 /= #survey survey.100
scoreboard players operation #survey survey.disto.inclination_decimal_2 = #survey survey.disto.inclination_abs 
scoreboard players operation #survey survey.disto.inclination_decimal_2 %= #survey survey.100
scoreboard players operation #survey survey.disto.inclination_decimal_2 /= #survey survey.10

# get shot azimuth
execute if score #survey survey.disto.inclination matches -89999..89998 store result score #survey survey.disto.azimuth run data get entity @e[tag=disto_origin_pos,limit=1,type=marker,distance=..4] Rotation[0] 1000
execute unless score #survey survey.disto.inclination matches -89999..89998 store result score #survey survey.disto.azimuth run data get entity @s Rotation[0] 1000
execute if data storage survey:data {disto:{shot:{origin:"witeout"}}} at @e[tag=disto_origin_pos,type=marker,distance=..4] if entity @e[tag=disto_target_pos,distance=..0.01,type=marker] store result score #survey survey.disto.azimuth run data get entity @s Rotation[0] 1000
# apply rotation
execute if data storage survey:data {disto:{shot:{backsight_mode:0b}}} run scoreboard players add #survey survey.disto.azimuth 180000
execute if data storage survey:data {disto:{shot:{backsight_mode:0b}}} if score #survey survey.disto.azimuth matches -180000..-1 run scoreboard players add #survey survey.disto.azimuth 360000
# calculate azimuth display objectives
scoreboard players operation #survey survey.disto.azimuth_decimal_3 = #survey survey.disto.azimuth
scoreboard players operation #survey survey.disto.azimuth_decimal_3 %= #survey survey.10
execute if score #survey survey.disto.azimuth_decimal_3 matches 5..9 run scoreboard players add #survey survey.disto.azimuth 10
scoreboard players operation #survey survey.disto.azimuth_whole = #survey survey.disto.azimuth
scoreboard players operation #survey survey.disto.azimuth_whole /= #survey survey.1000
scoreboard players operation #survey survey.disto.azimuth_decimal_1 = #survey survey.disto.azimuth
scoreboard players operation #survey survey.disto.azimuth_decimal_1 %= #survey survey.1000
scoreboard players operation #survey survey.disto.azimuth_decimal_1 /= #survey survey.100
scoreboard players operation #survey survey.disto.azimuth_decimal_2 = #survey survey.disto.azimuth
scoreboard players operation #survey survey.disto.azimuth_decimal_2 %= #survey survey.100
scoreboard players operation #survey survey.disto.azimuth_decimal_2 /= #survey survey.10

# calculate distance (1000 scale) from raycast step counters 
scoreboard players operation #survey survey.disto.forwards_distance = #survey survey.disto.forwards_raycast_steps
# +0.1 blocks per forwards raycast step
scoreboard players operation #survey survey.disto.forwards_distance *= #survey survey.100
# -0.001 blocks per backwards raycast step
scoreboard players operation #survey survey.disto.backwards_distance = #survey survey.disto.backwards_raycast_steps
# +0.1 block offset if body/witeout origin
execute unless data storage survey:data {disto:{shot:{origin:"eyes"}}} run scoreboard players remove #survey survey.disto.backwards_distance 100
scoreboard players operation #survey survey.disto.distance = #survey survey.disto.forwards_distance
scoreboard players operation #survey survey.disto.distance -= #survey survey.disto.backwards_distance
# calculate distance display objectives
scoreboard players operation #survey survey.disto.distance_decimal_3 = #survey survey.disto.distance
scoreboard players operation #survey survey.disto.distance_decimal_3 %= #survey survey.10
execute if score #survey survey.disto.distance_decimal_3 matches 5..9 run scoreboard players add #survey survey.disto.distance 10
scoreboard players operation #survey survey.disto.distance_whole = #survey survey.disto.distance
scoreboard players operation #survey survey.disto.distance_whole /= #survey survey.1000
scoreboard players operation #survey survey.disto.distance_decimal_1 = #survey survey.disto.distance
scoreboard players operation #survey survey.disto.distance_decimal_1 %= #survey survey.1000
scoreboard players operation #survey survey.disto.distance_decimal_1 /= #survey survey.100
scoreboard players operation #survey survey.disto.distance_decimal_2 = #survey survey.disto.distance
scoreboard players operation #survey survey.disto.distance_decimal_2 %= #survey survey.100
scoreboard players operation #survey survey.disto.distance_decimal_2 /= #survey survey.10