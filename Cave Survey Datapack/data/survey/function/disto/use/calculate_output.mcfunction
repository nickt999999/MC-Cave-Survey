# get shot inclination and rotation
execute if items entity @s weapon.* minecraft:music_disc_lava_chicken[minecraft:custom_data~{"backsight_mode":0b}] store result score #survey disto_inclination run data get entity @e[tag=disto_origin_pos,limit=1,type=marker,distance=..4] Rotation[1] -1000
execute if items entity @s weapon.* minecraft:music_disc_lava_chicken[minecraft:custom_data~{"backsight_mode":1b}] store result score #survey disto_inclination run data get entity @e[tag=disto_origin_pos,limit=1,type=marker,distance=..4] Rotation[1] 1000
# calculate absolute value for floor rounding
scoreboard players operation #survey disto_inclination_abs = #survey disto_inclination
execute if score #survey disto_inclination matches -2147483648..0 run scoreboard players operation #survey disto_inclination_abs *= #survey -1
# calculate inclination display objectives
scoreboard players operation #survey disto_inclination_decimal_3 = #survey disto_inclination_abs
scoreboard players operation #survey disto_inclination_decimal_3 %= #survey 10
execute if score #survey disto_inclination_decimal_3 matches 5..9 run scoreboard players add #survey disto_inclination_abs 10
scoreboard players operation #survey disto_inclination_whole = #survey disto_inclination_abs 
scoreboard players operation #survey disto_inclination_whole /= #survey 1000
execute if score #survey disto_inclination matches -2147483648..0 run scoreboard players operation #survey disto_inclination_whole *= #survey -1
scoreboard players operation #survey disto_inclination_decimal_1 = #survey disto_inclination_abs 
scoreboard players operation #survey disto_inclination_decimal_1 %= #survey 1000
scoreboard players operation #survey disto_inclination_decimal_1 /= #survey 100
scoreboard players operation #survey disto_inclination_decimal_2 = #survey disto_inclination_abs 
scoreboard players operation #survey disto_inclination_decimal_2 %= #survey 100
scoreboard players operation #survey disto_inclination_decimal_2 /= #survey 10

# get shot azimuth
execute if score #survey disto_inclination matches -89999..89998 store result score #survey disto_azimuth run data get entity @e[tag=disto_origin_pos,limit=1,type=marker,distance=..4] Rotation[0] 1000
execute unless score #survey disto_inclination matches -89999..89998 store result score #survey disto_azimuth run data get entity @s Rotation[0] 1000
execute if data storage survey:data {disto:{shot:{origin:"witeout"}}} at @e[tag=disto_origin_pos,type=marker,distance=..4] if entity @e[tag=disto_target_pos,distance=..0.01,type=marker] store result score #survey disto_azimuth run data get entity @s Rotation[0] 1000
# apply rotation
execute if items entity @s weapon.* minecraft:music_disc_lava_chicken[minecraft:custom_data~{"backsight_mode":0b}] run scoreboard players add #survey disto_azimuth 180000
execute if items entity @s weapon.* minecraft:music_disc_lava_chicken[minecraft:custom_data~{"backsight_mode":1b}] if score #survey disto_azimuth matches -180000..-1 run scoreboard players add #survey disto_azimuth 360000
# calculate azimuth display objectives
scoreboard players operation #survey disto_azimuth_decimal_3 = #survey disto_azimuth
scoreboard players operation #survey disto_azimuth_decimal_3 %= #survey 10
execute if score #survey disto_azimuth_decimal_3 matches 5..9 run scoreboard players add #survey disto_azimuth 10
scoreboard players operation #survey disto_azimuth_whole = #survey disto_azimuth
scoreboard players operation #survey disto_azimuth_whole /= #survey 1000
scoreboard players operation #survey disto_azimuth_decimal_1 = #survey disto_azimuth
scoreboard players operation #survey disto_azimuth_decimal_1 %= #survey 1000
scoreboard players operation #survey disto_azimuth_decimal_1 /= #survey 100
scoreboard players operation #survey disto_azimuth_decimal_2 = #survey disto_azimuth
scoreboard players operation #survey disto_azimuth_decimal_2 %= #survey 100
scoreboard players operation #survey disto_azimuth_decimal_2 /= #survey 10

# calculate distance (1000 scale) from raycast step counters 
scoreboard players operation #survey disto_forwards_distance = #survey disto_forwards_raycast_steps
# +0.1 blocks per forwards raycast step
scoreboard players operation #survey disto_forwards_distance *= #survey 100
# -0.001 blocks per backwards raycast step
scoreboard players operation #survey disto_backwards_distance = #survey disto_backwards_raycast_steps
# +0.1 block offset if body/witeout origin
execute unless data storage survey:data {disto:{shot:{origin:"eyes"}}} run scoreboard players remove #survey disto_backwards_distance 100
scoreboard players operation #survey disto_distance = #survey disto_forwards_distance
scoreboard players operation #survey disto_distance -= #survey disto_backwards_distance
# calculate distance display objectives
scoreboard players operation #survey disto_distance_decimal_3 = #survey disto_distance
scoreboard players operation #survey disto_distance_decimal_3 %= #survey 10
execute if score #survey disto_distance_decimal_3 matches 5..9 run scoreboard players add #survey disto_distance 10
scoreboard players operation #survey disto_distance_whole = #survey disto_distance
scoreboard players operation #survey disto_distance_whole /= #survey 1000
scoreboard players operation #survey disto_distance_decimal_1 = #survey disto_distance
scoreboard players operation #survey disto_distance_decimal_1 %= #survey 1000
scoreboard players operation #survey disto_distance_decimal_1 /= #survey 100
scoreboard players operation #survey disto_distance_decimal_2 = #survey disto_distance
scoreboard players operation #survey disto_distance_decimal_2 %= #survey 100
scoreboard players operation #survey disto_distance_decimal_2 /= #survey 10