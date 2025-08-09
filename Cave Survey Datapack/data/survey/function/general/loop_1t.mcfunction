# run datapack command if command objective triggered
execute if score @s survey.clear_flagging_tape matches 1.. run function survey:command/clear_flagging_tape
execute if score @s survey.clear_witeout matches 1.. run function survey:command/clear_witeout
execute if score @s survey.give_disto matches 1.. run function survey:command/give_disto
execute if score @s survey.give_flagging_tape matches 1.. run function survey:command/give_flagging_tape
execute if score @s survey.give_headlamp matches 1.. run function survey:command/give_headlamp
execute if score @s survey.give_witeout matches 1.. run function survey:command/give_witeout
execute if score @s survey.help matches 1.. run function survey:command/help
execute if score @s survey.uninstall matches 1.. run function survey:command/uninstall

# update disto timers
execute if score @s disto_swaphands_timer matches 1..5 run scoreboard players remove @s disto_swaphands_timer 1
# toggle backsight mode if player swaps hands with disto twice
execute if items entity @s weapon.* minecraft:music_disc_lava_chicken[minecraft:custom_data~{disto:1b}] if function survey:disto/backsight_mode/if_double_swaphands at @s run function survey:disto/backsight_mode/toggle with storage survey:data disto.backsight_mode
# set new disto item id 
execute if data entity @s Inventory[{id:"minecraft:music_disc_lava_chicken",components:{"minecraft:custom_data":{disto:1b,disto_id:0b}}}] run function survey:disto/id/set_item_id

# process flagging tape if player holding flagging tape
execute at @s if items entity @s weapon.mainhand writable_book[minecraft:custom_data~{flagging_tape:1b}] run function survey:flagging_tape/use/hold_item {slot:"mainhand",item:"writable_book"}
execute at @s if items entity @s weapon.mainhand written_book[minecraft:custom_data~{flagging_tape:1b}] run function survey:flagging_tape/use/hold_item {slot:"mainhand",item:"written_book"}
execute at @s if items entity @s weapon.offhand writable_book[minecraft:custom_data~{flagging_tape:1b}] run function survey:flagging_tape/use/hold_item {slot:"offhand",item:"writable_book"}
execute at @s if items entity @s weapon.offhand written_book[minecraft:custom_data~{flagging_tape:1b}] run function survey:flagging_tape/use/hold_item {slot:"offhand",item:"written_book"}

# update headlamp light
execute at @s run function survey:headlamp/update_light

# reset player right click objectives
scoreboard players set @s[scores={click_writable_book=1..}] click_writable_book 0