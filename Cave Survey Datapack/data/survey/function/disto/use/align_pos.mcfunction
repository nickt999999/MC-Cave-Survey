# spawn new position marker
kill @e[tag=align_pos,type=marker,distance=..260]
summon marker ^ ^ ^ {Tags:["align_pos","survey_datapack"]}

# round position marker x coordinate to 2 decimals
execute store result score #survey survey.disto.align_pos_x run data get entity @e[tag=align_pos,limit=1,type=marker,distance=..0.1] Pos[0] 1000
scoreboard players operation #survey survey.disto.align_pos_x_decimal_3 = #survey survey.disto.align_pos_x
scoreboard players operation #survey survey.disto.align_pos_x_decimal_3 %= #survey survey.general.10
execute if score #survey survey.disto.align_pos_x_decimal_3 matches 5..9 run scoreboard players add #survey survey.disto.align_pos_x 10
scoreboard players operation #survey survey.disto.align_pos_x /= #survey survey.general.10
execute store result storage survey:data disto.shot.align_pos.x double 0.01 run scoreboard players get #survey survey.disto.align_pos_x
data modify entity @e[tag=align_pos,limit=1,type=marker,distance=..0.1] Pos[0] set from storage survey:data disto.shot.align_pos.x
# round position marker y coordinate to 2 decimals
execute store result score #survey survey.disto.align_pos_y run data get entity @e[tag=align_pos,limit=1,type=marker,distance=..0.1] Pos[1] 1000
scoreboard players operation #survey survey.disto.align_pos_y_decimal_3 = #survey survey.disto.align_pos_y
scoreboard players operation #survey survey.disto.align_pos_y_decimal_3 %= #survey survey.general.10
execute if score #survey survey.disto.align_pos_y_decimal_3 matches 5..9 run scoreboard players add #survey survey.disto.align_pos_y 10
scoreboard players operation #survey survey.disto.align_pos_y /= #survey survey.general.10
execute store result storage survey:data disto.shot.align_pos.y double 0.01 run scoreboard players get #survey survey.disto.align_pos_y
data modify entity @e[tag=align_pos,limit=1,type=marker,distance=..0.1] Pos[1] set from storage survey:data disto.shot.align_pos.y
# round position marker z coordinate to 2 decimals
execute store result score #survey survey.disto.align_pos_z run data get entity @e[tag=align_pos,limit=1,type=marker,distance=..0.1] Pos[2] 1000
scoreboard players operation #survey survey.disto.align_pos_z_decimal_3 = #survey survey.disto.align_pos_z
scoreboard players operation #survey survey.disto.align_pos_z_decimal_3 %= #survey survey.general.10
execute if score #survey survey.disto.align_pos_z_decimal_3 matches 5..9 run scoreboard players add #survey survey.disto.align_pos_z 10
scoreboard players operation #survey survey.disto.align_pos_z /= #survey survey.general.10
execute store result storage survey:data disto.shot.align_pos.z double 0.01 run scoreboard players get #survey survey.disto.align_pos_z
data modify entity @e[tag=align_pos,limit=1,type=marker,distance=..0.1] Pos[2] set from storage survey:data disto.shot.align_pos.z