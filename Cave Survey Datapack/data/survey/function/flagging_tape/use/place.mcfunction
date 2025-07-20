# spawn flagging tape
summon text_display ~ ~ ~ {Tags:["flagging_tape","survey_datapack"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[0.5f,0.5f,0.5f]},text_opacity:255,background:-5885182}
# spawn flagging tape raycast target position marker
summon marker ~ ~ ~ {Tags:["flagging_tape_placed_target_pos","survey_datapack"]}
tp @e[tag=flagging_tape_placed_target_pos,sort=nearest,limit=1,type=marker,distance=..0.1] ~ ~ ~ ~ ~

# get flagging tape coordinates
execute store result score #survey flagging_tape_x run data get entity @e[tag=flagging_tape,type=text_display,distance=..0.1,sort=nearest,limit=1] Pos[0] 1000
execute store result score #survey flagging_tape_y run data get entity @e[tag=flagging_tape,type=text_display,distance=..0.1,sort=nearest,limit=1] Pos[1] 1000
execute store result score #survey flagging_tape_z run data get entity @e[tag=flagging_tape,type=text_display,distance=..0.1,sort=nearest,limit=1] Pos[2] 1000
# get player azimuth
execute store result score #survey player_azimuth run data get entity @s Rotation[0] 100
# calculate decimal of each flagging tape coordinate
scoreboard players operation #survey flagging_tape_x_decimal = #survey flagging_tape_x
scoreboard players operation #survey flagging_tape_x_decimal %= #survey 1000
scoreboard players operation #survey flagging_tape_y_decimal = #survey flagging_tape_y
scoreboard players operation #survey flagging_tape_y_decimal %= #survey 1000
scoreboard players operation #survey flagging_tape_z_decimal = #survey flagging_tape_z
scoreboard players operation #survey flagging_tape_z_decimal %= #survey 1000
# set flagging tape rotation
execute if score #survey flagging_tape_x_decimal matches 0 as @e[tag=flagging_tape,type=text_display,distance=..0.1,sort=nearest,limit=1] run tp @s ~ ~ ~ -90 0
execute if score #survey flagging_tape_x_decimal matches 999 as @e[tag=flagging_tape,type=text_display,distance=..0.1,sort=nearest,limit=1] run tp @s ~ ~ ~ 90 0
execute if score #survey flagging_tape_y_decimal matches 0 if score #survey player_azimuth matches -13500..-4500 as @e[tag=flagging_tape,type=text_display,distance=..0.1,sort=nearest,limit=1] at @s run tp @s ~ ~ ~ 90 -90
execute if score #survey flagging_tape_y_decimal matches 0 if score #survey player_azimuth matches 4500..13500 as @e[tag=flagging_tape,type=text_display,distance=..0.1,sort=nearest,limit=1] at @s run tp @s ~ ~ ~ -90 -90
execute if score #survey flagging_tape_y_decimal matches 0 if score #survey player_azimuth matches -4500..4500 as @e[tag=flagging_tape,type=text_display,distance=..0.1,sort=nearest,limit=1] at @s run tp @s ~ ~ ~ 180 -90
execute if score #survey flagging_tape_y_decimal matches 0 if score #survey player_azimuth matches -18000..-13500 as @e[tag=flagging_tape,type=text_display,distance=..0.1,sort=nearest,limit=1] at @s run tp @s ~ ~ ~ 0 -90
execute if score #survey flagging_tape_y_decimal matches 0 if score #survey player_azimuth matches 13500..18000 as @e[tag=flagging_tape,type=text_display,distance=..0.1,sort=nearest,limit=1] at @s run tp @s ~ ~ ~ 0 -90
execute if score #survey flagging_tape_y_decimal matches 999 if score #survey player_azimuth matches -13500..-4500 as @e[tag=flagging_tape,type=text_display,distance=..0.1,sort=nearest,limit=1] at @s run tp @s ~ ~ ~ 90 90
execute if score #survey flagging_tape_y_decimal matches 999 if score #survey player_azimuth matches 4500..13500 as @e[tag=flagging_tape,type=text_display,distance=..0.1,sort=nearest,limit=1] at @s run tp @s ~ ~ ~ -90 90
execute if score #survey flagging_tape_y_decimal matches 999 if score #survey player_azimuth matches -4500..4500 as @e[tag=flagging_tape,type=text_display,distance=..0.1,sort=nearest,limit=1] at @s run tp @s ~ ~ ~ 180 90
execute if score #survey flagging_tape_y_decimal matches 999 if score #survey player_azimuth matches -18000..-13500 as @e[tag=flagging_tape,type=text_display,distance=..0.1,sort=nearest,limit=1] at @s run tp @s ~ ~ ~ 0 90
execute if score #survey flagging_tape_y_decimal matches 999 if score #survey player_azimuth matches 13500..18000 as @e[tag=flagging_tape,type=text_display,distance=..0.1,sort=nearest,limit=1] at @s run tp @s ~ ~ ~ 0 90
execute if score #survey flagging_tape_z_decimal matches 0 as @e[tag=flagging_tape,type=text_display,distance=..0.1,sort=nearest,limit=1] run tp @s ~ ~ ~ 0 0
execute if score #survey flagging_tape_z_decimal matches 999 as @e[tag=flagging_tape,type=text_display,distance=..0.1,sort=nearest,limit=1] run tp @s ~ ~ ~ 180 0

# set flagging tape text
function survey:flagging_tape/use/set_tape_text with storage survey:data flagging_tape

# get item damage
execute if data storage survey:data {flagging_tape:{slot:"mainhand"}} store result score #survey flagging_tape_damage run data get entity @s SelectedItem.components."minecraft:damage" 1
execute if data storage survey:data {flagging_tape:{slot:"offhand"}} store result score #survey flagging_tape_damage run data get entity @s equipment.offhand.components."minecraft:damage" 1
# increment item damage if survival/adventure mode
execute unless entity @s[gamemode=creative] run scoreboard players add #survey flagging_tape_damage 1
# store item damage in storage path
execute store result storage survey:data flagging_tape.damage int 1 run scoreboard players get #survey flagging_tape_damage