# set item slot in storage path
$data modify storage survey:data witeout.slot set value $(slot)
# increment item damage
execute if data storage survey:data {witeout:{slot:"mainhand"}} store result score #survey witeout_damage run data get entity @s SelectedItem.components."minecraft:damage" 1
execute if data storage survey:data {witeout:{slot:"offhand"}} store result score #survey witeout_damage run data get entity @s equipment.offhand.components."minecraft:damage" 1
scoreboard players add #survey witeout_damage 1
# store item damage in storage path
execute store result storage survey:data witeout.damage int 1 run scoreboard players get #survey witeout_damage

# update item damage if below item max damage
execute unless score #survey witeout_damage matches 70 run function survey:witeout/item/replace with storage survey:data witeout
# break item if reaches item max damage
execute if score #survey witeout_damage matches 70 at @s run function survey:witeout/item/break with storage survey:data witeout