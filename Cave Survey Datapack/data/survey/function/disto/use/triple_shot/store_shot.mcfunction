# add history storage path for item
$execute unless data storage survey:data disto.shot.history[{disto_id:$(disto_id)}] run data modify storage survey:data disto.shot.history append value {disto_id:$(disto_id),shot_1:[0,0,0],shot_2:[0,0,0],shot_3:[0,0,0]}
# set history path shot 3 from history path shot 2
$data modify storage survey:data disto.shot.history[{disto_id:$(disto_id)}].shot_3[0] set from storage survey:data disto.shot.history[{disto_id:$(disto_id)}].shot_2[0]
$data modify storage survey:data disto.shot.history[{disto_id:$(disto_id)}].shot_3[1] set from storage survey:data disto.shot.history[{disto_id:$(disto_id)}].shot_2[1]
$data modify storage survey:data disto.shot.history[{disto_id:$(disto_id)}].shot_3[2] set from storage survey:data disto.shot.history[{disto_id:$(disto_id)}].shot_2[2]
# set history path shot 2 from history path shot 1
$data modify storage survey:data disto.shot.history[{disto_id:$(disto_id)}].shot_2[0] set from storage survey:data disto.shot.history[{disto_id:$(disto_id)}].shot_1[0]
$data modify storage survey:data disto.shot.history[{disto_id:$(disto_id)}].shot_2[1] set from storage survey:data disto.shot.history[{disto_id:$(disto_id)}].shot_1[1]
$data modify storage survey:data disto.shot.history[{disto_id:$(disto_id)}].shot_2[2] set from storage survey:data disto.shot.history[{disto_id:$(disto_id)}].shot_1[2]
# set history path shot 1 from current shot
$execute store result storage survey:data disto.shot.history[{disto_id:$(disto_id)}].shot_1[0] int 1 run scoreboard players get #survey disto_azimuth
$execute store result storage survey:data disto.shot.history[{disto_id:$(disto_id)}].shot_1[1] int 1 run scoreboard players get #survey disto_inclination
$execute store result storage survey:data disto.shot.history[{disto_id:$(disto_id)}].shot_1[2] int 1 run scoreboard players get #survey disto_distance