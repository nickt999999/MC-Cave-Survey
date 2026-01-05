# play second beep
execute store result score #survey survey.current_gametime run time query gametime
execute as @a[tag=survey.disto.triple_shot_beep_center] if score @s survey.disto.triple_shot_beep_gametime <= #survey survey.current_gametime at @s run playsound block.note_block.bit master @a ~ ~ ~ 0.75 1.781797
execute as @a[tag=survey.disto.triple_shot_beep_eyes] if score @s survey.disto.triple_shot_beep_gametime <= #survey survey.current_gametime at @s run playsound block.note_block.bit master @a ~ ~ ~ 0.75 1.587401
execute as @a[tag=survey.disto.triple_shot_beep_witeout] if score @s survey.disto.triple_shot_beep_gametime <= #survey survey.current_gametime at @s run playsound block.note_block.bit master @a ~ ~ ~ 0.75 2
# remove triple shot tag and objective
execute as @a[tag=survey.disto.triple_shot_beep_center] if score @s survey.disto.triple_shot_beep_gametime <= #survey survey.current_gametime run tag @s remove survey.disto.triple_shot_beep_center
execute as @a[tag=survey.disto.triple_shot_beep_eyes] if score @s survey.disto.triple_shot_beep_gametime <= #survey survey.current_gametime run tag @s remove survey.disto.triple_shot_beep_eyes
execute as @a[tag=survey.disto.triple_shot_beep_witeout] if score @s survey.disto.triple_shot_beep_gametime <= #survey survey.current_gametime run tag @s remove survey.disto.triple_shot_beep_witeout
execute as @a if score @s survey.disto.triple_shot_beep_gametime <= #survey survey.current_gametime run scoreboard players reset @s survey.disto.triple_shot_beep_gametime