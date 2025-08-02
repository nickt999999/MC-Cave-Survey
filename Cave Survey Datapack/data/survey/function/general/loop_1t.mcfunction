# use disto if player right click item
execute as @a at @s if score @s click_carrot_stick matches 1.. unless score @s disto_cooldown matches 1..20 if items entity @s weapon.mainhand carrot_on_a_stick[custom_data~{disto:1b}] run function survey:disto/use/take_shot {slot:"mainhand"}
execute as @a at @s if score @s click_carrot_stick matches 1.. unless score @s disto_cooldown matches 1..20 if items entity @s weapon.offhand carrot_on_a_stick[custom_data~{disto:1b}] unless items entity @s weapon.mainhand carrot_on_a_stick[custom_data~{"survey_tool":1b}] run function survey:disto/use/take_shot {slot:"offhand"}
# update disto timers
scoreboard players remove @a[scores={disto_cooldown=1..20}] disto_cooldown 1
execute as @a if score @s disto_swaphands_timer matches 1..5 run scoreboard players remove @s disto_swaphands_timer 1
# toggle backsight mode if player swaps hands with disto twice
execute as @a if items entity @s weapon.* carrot_on_a_stick[custom_data~{disto:1b}] if function survey:disto/backsight_mode/if_double_swaphands at @s run function survey:disto/backsight_mode/toggle with storage survey:data disto.backsight_mode
# set new disto item id
execute as @a if data entity @s Inventory[{id:"minecraft:carrot_on_a_stick",components:{"minecraft:custom_data":{disto:1b,disto_id:0b}}}] run function survey:disto/id/set_item_id

# process witeout if player right click item
execute as @a at @s if score @s click_carrot_stick matches 1.. if items entity @s weapon.mainhand carrot_on_a_stick[custom_data~{witeout:1b}] run function survey:witeout/use/rclick_item {slot:"mainhand"}
execute as @a at @s if score @s click_carrot_stick matches 1.. if items entity @s weapon.offhand carrot_on_a_stick[custom_data~{witeout:1b}] unless items entity @s weapon.mainhand carrot_on_a_stick[custom_data~{"survey_tool":1b}] run function survey:witeout/use/rclick_item {slot:"offhand"}

# process flagging tape if player holding item
execute as @a at @s if items entity @s weapon.mainhand writable_book[custom_data~{flagging_tape:1b}] run function survey:flagging_tape/use/hold_item {slot:"mainhand",item:"writable_book"}
execute as @a at @s if items entity @s weapon.mainhand written_book[custom_data~{flagging_tape:1b}] run function survey:flagging_tape/use/hold_item {slot:"mainhand",item:"written_book"}
execute as @a at @s if items entity @s weapon.offhand writable_book[custom_data~{flagging_tape:1b}] run function survey:flagging_tape/use/hold_item {slot:"offhand",item:"writable_book"}
execute as @a at @s if items entity @s weapon.offhand written_book[custom_data~{flagging_tape:1b}] run function survey:flagging_tape/use/hold_item {slot:"offhand",item:"written_book"}

# update headlamp light
execute as @a at @s run function survey:headlamp/update_light

# reset player right click objectives
scoreboard players set @a[scores={click_carrot_stick=1..}] click_carrot_stick 0
scoreboard players set @a[scores={click_writable_book=1..}] click_writable_book 0