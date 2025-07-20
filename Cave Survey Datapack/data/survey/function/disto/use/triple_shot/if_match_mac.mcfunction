# get last 3 inclination measurements
$execute store result score #survey disto_inclination_history_1 run data get storage survey:data disto.shot.history.[{disto_id:$(disto_id)}].shot_1[1]
$execute store result score #survey disto_inclination_history_2 run data get storage survey:data disto.shot.history.[{disto_id:$(disto_id)}].shot_2[1]
$execute store result score #survey disto_inclination_history_3 run data get storage survey:data disto.shot.history.[{disto_id:$(disto_id)}].shot_3[1]
# return false if >1.7deg inclination error
scoreboard players operation #survey disto_error = #survey disto_inclination_history_2
scoreboard players operation #survey disto_error -= #survey disto_inclination_history_1
execute unless score #survey disto_error matches -1700..1700 run return 0
scoreboard players operation #survey disto_error = #survey disto_inclination_history_3
scoreboard players operation #survey disto_error -= #survey disto_inclination_history_2
execute unless score #survey disto_error matches -1700..1700 run return 0

# get last 3 azimuth measurements
$execute store result score #survey disto_azimuth_history_1 run data get storage survey:data disto.shot.history.[{disto_id:$(disto_id)}].shot_1[0]
$execute store result score #survey disto_azimuth_history_2 run data get storage survey:data disto.shot.history.[{disto_id:$(disto_id)}].shot_2[0]
$execute store result score #survey disto_azimuth_history_3 run data get storage survey:data disto.shot.history.[{disto_id:$(disto_id)}].shot_3[0]
# return false if >1.7deg azimuth error
scoreboard players operation #survey disto_error = #survey disto_azimuth_history_2
scoreboard players operation #survey disto_error -= #survey disto_azimuth_history_1
execute unless score #survey disto_error matches -1700..1700 run return 0
scoreboard players operation #survey disto_error = #survey disto_azimuth_history_3
scoreboard players operation #survey disto_error -= #survey disto_azimuth_history_2
execute unless score #survey disto_error matches -1700..1700 run return 0

# get last 3 distance measurements
$execute store result score #survey disto_distance_history_1 run data get storage survey:data disto.shot.history.[{disto_id:$(disto_id)}].shot_1[2]
$execute store result score #survey disto_distance_history_2 run data get storage survey:data disto.shot.history.[{disto_id:$(disto_id)}].shot_2[2]
$execute store result score #survey disto_distance_history_3 run data get storage survey:data disto.shot.history.[{disto_id:$(disto_id)}].shot_3[2]
# return false if >0.05m distance error
scoreboard players operation #survey disto_error = #survey disto_distance_history_2
scoreboard players operation #survey disto_error -= #survey disto_distance_history_1
execute unless score #survey disto_error matches -5..5 run return 0
scoreboard players operation #survey disto_error = #survey disto_distance_history_3
scoreboard players operation #survey disto_error -= #survey disto_distance_history_2
execute unless score #survey disto_error matches -5..5 run return 0

# else - return true
return 1