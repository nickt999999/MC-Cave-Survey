# rough forwards direction raycast from player's eyes
tag @s add self
execute if entity @s[gamemode=creative] run scoreboard players set #survey flagging_tape_raycast_steps 0
execute if entity @s[gamemode=!creative] run scoreboard players set #survey flagging_tape_raycast_steps 10
execute anchored eyes positioned ^ ^ ^ run function survey:flagging_tape/raycast/raycast_forwards_loop
# precise backwards direction raycast if raycast hits block
execute if data storage survey:data {flagging_tape:{raycast_result:"block"}} at @e[tag=flagging_tape_target_pos,type=marker,distance=..10] run function survey:flagging_tape/raycast/raycast_backwards_loop
# remove raycast tag
tag @s remove self