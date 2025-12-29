# run datapack command if command objective triggered
execute if score @s survey.clear_flagging_tape matches 1.. run function survey:command/clear_flagging_tape
execute if score @s survey.clear_witeout matches 1.. run function survey:command/clear_witeout
execute if score @s survey.give_disto matches 1.. run function survey:command/give_disto
execute if score @s survey.give_flagging_tape matches 1.. run function survey:command/give_flagging_tape
execute if score @s survey.give_headlamp matches 1.. run function survey:command/give_headlamp
execute if score @s survey.give_witeout matches 1.. run function survey:command/give_witeout
execute if score @s survey.help matches 1.. run function survey:command/help
execute if score @s survey.uninstall matches 1.. run function survey:command/uninstall

# toggle backsight mode if player swaps hands with disto twice
execute if function survey:disto/backsight_mode/if_double_swaphands at @s run function survey:disto/backsight_mode/toggle with storage survey:data disto.backsight_mode
# update disto rclick tags
execute unless entity @s[tag=rclick_disto_tick] run tag @s remove rclick_disto_hold
tag @s remove rclick_disto_tick
# set new disto item id 
execute if items entity @s container.* minecraft:music_disc_lava_chicken[minecraft:custom_data~{disto:1b,disto_id:0b}] run function survey:disto/id/set_item_id

# update/use flagging tape if player holding item
execute if items entity @s weapon.* *[minecraft:custom_data~{flagging_tape:1b}] at @s run function survey:flagging_tape/use/hold_item
# reset right click item objective
execute if score @s survey.click_writable_book matches 1.. run scoreboard players set @s survey.click_writable_book 0

# remove headlamp light from previous tick
execute at @s run function survey:headlamp/use/remove_light
# add headlamp light if player holding/wearing headlamp
execute if items entity @s weapon.* minecraft:music_disc_lava_chicken[minecraft:custom_data~{headlamp:1b}] at @s run function survey:headlamp/use/add_light
execute if items entity @s armor.head minecraft:music_disc_lava_chicken[minecraft:custom_data~{headlamp:1b}] at @s run function survey:headlamp/use/add_light

# update witeout rclick tags
execute unless entity @s[tag=rclick_witeout_tick] run tag @s remove rclick_witeout_hold
tag @s remove rclick_witeout_tick