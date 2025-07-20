# store disto id in storage path
execute if data storage survey:data {disto:{shot:{slot:"mainhand"}}} run data modify storage survey:data disto.shot.disto_id set from entity @s SelectedItem.components."minecraft:custom_data".disto_id
execute if data storage survey:data {disto:{shot:{slot:"offhand"}}} run data modify storage survey:data disto.shot.disto_id set from entity @s equipment.offhand.components."minecraft:custom_data".disto_id

# reutrn result - compare last 3 shots
return run function survey:disto/use/triple_shot/if_match_mac with storage survey:data disto.shot