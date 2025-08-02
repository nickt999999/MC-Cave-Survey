# store slot and item in storage path
$data modify storage survey:data witeout.slot set value $(slot)

# 4.5-5m range raycast
tag @s add self
execute if entity @s[gamemode=creative] run scoreboard players set #survey witeout_raycast_steps 0
execute if entity @s[gamemode=!creative] run scoreboard players set #survey witeout_raycast_steps 50
execute anchored eyes positioned ^ ^ ^ run function survey:witeout/raycast/raycast_loop

# place witeout blot if raycast hits block
execute if data storage survey:data {witeout:{raycast_result:"block"}} at @e[tag=witeout_target_pos,type=marker,distance=..10] run function survey:witeout/use/place
# break witeout blot if raycast hits witeout
execute if data storage survey:data {witeout:{raycast_result:"witeout"}} at @e[tag=witeout_target_pos,sort=nearest,limit=1,type=marker,distance=..10] run function survey:witeout/break
# play witeout place/break sound if valid raycast result
execute unless data storage survey:data {witeout:{raycast_result:"entity"}} unless data storage survey:data {witeout:{raycast_result:"range_limit"}} at @e[tag=witeout_target_pos,sort=nearest,limit=1,type=marker,distance=..10] run playsound entity.slime.squish master @a ~ ~ ~ 0.5


# remove raycast tag and marker
tag @s remove self
kill @e[tag=witeout_target_pos,type=marker,distance=..10]