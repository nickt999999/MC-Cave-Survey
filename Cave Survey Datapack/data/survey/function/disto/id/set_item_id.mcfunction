# store inventory slot in storage path
execute store result storage survey:data disto.id.slot int 1 run data get entity @s Inventory[{id:"minecraft:music_disc_lava_chicken",components:{"minecraft:custom_data":{disto:1b,disto_id:0b}}}].Slot
# update item disto id
execute store result storage survey:data survey.disto.id_counter int 1 run scoreboard players add #survey survey.disto.id_counter 1
function survey:disto/id/replace_item with storage survey:data disto.id