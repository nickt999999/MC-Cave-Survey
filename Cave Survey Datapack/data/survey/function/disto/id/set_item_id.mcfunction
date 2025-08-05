# update disto id counter
#execute store result score #survey disto_id_counter run data get storage survey:data disto.id.counter 1
scoreboard players add #survey disto_id_counter 1
execute store result storage survey:data disto.id.counter int 1 run scoreboard players get #survey disto_id_counter

# store inventory slot in storage path
execute store result storage survey:data disto.id.slot int 1 run data get entity @s Inventory[{id:"minecraft:music_disc_lava_chicken",components:{"minecraft:custom_data":{disto:1b,disto_id:0b}}}].Slot
# replace item with updated data
function survey:disto/id/replace_item with storage survey:data disto.id