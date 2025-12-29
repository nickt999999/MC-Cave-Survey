# spawn position test marker
kill @e[tag=survey.disto.range_test_pos,type=marker,distance=..10]
summon marker ~ ~ ~ {Tags:["survey.disto.range_test_pos","survey_datapack"]}
# increment raycast step counter
execute if entity @e[tag=survey.disto.range_test_pos,type=marker,distance=..10] if score #survey survey.disto.forwards_raycast_steps matches ..255 run scoreboard players add #survey survey.disto.forwards_raycast_steps 1 
# loop raycast forwards if position loaded
execute if entity @e[tag=survey.disto.range_test_pos,type=marker,distance=..10] if score #survey survey.disto.forwards_raycast_steps matches ..255 positioned ^ ^ ^1 run function survey:disto/use/raycast/raycast_range_loop