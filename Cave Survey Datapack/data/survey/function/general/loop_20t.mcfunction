# display enable message if storage empty
execute unless data storage survey:data general.gametime run tellraw @a [{"text":"["},{"text":"SURVEY","color":"red"},{"text":"] "},{"text":"Cave survey datapack enabled. Use "},{"text":"/function survey:command/help","color":"yellow","click_event":{"action":"suggest_command","command":"/function survey:command/help"}},{"text":" for info & datapack commands"}]
# display enable message if datapack previously disabled
execute store result score #survey current_gametime run time query gametime
execute store result score #survey last_gametime run data get storage survey:data general.gametime
scoreboard players operation #survey gametime_change = #survey current_gametime
scoreboard players operation #survey gametime_change -= #survey last_gametime
execute if data storage survey:data general.gametime if score #survey gametime_change matches 50.. run tellraw @a [{"text":"["},{"text":"SURVEY","color":"red"},{"text":"] "},{"text":"Cave survey datapack enabled. Use "},{"text":"/function survey:command/help","color":"yellow","click_event":{"action":"suggest_command","command":"/function survey:command/help"}},{"text":" for info & datapack commands"}]
# store gametime in storage path
execute store result storage survey:data general.gametime int 1 run time query gametime

# give survey recipes
recipe give @a[tag=!survey_recipes] survey:disto
recipe give @a[tag=!survey_recipes] survey:witeout
recipe give @a[tag=!survey_recipes] survey:headlamp
recipe give @a[tag=!survey_recipes] survey:flagging_tape
# give recipe tag
tag @a[tag=!survey_recipes] add survey_recipes

# update confirm command timers
execute as @a if score @s uninstall_timer matches 1..100 run scoreboard players remove @s uninstall_timer 20
execute as @a if score @s clear_witeout_timer matches 1..100 run scoreboard players remove @s clear_witeout_timer 20
execute as @a if score @s clear_flagging_tape_timer matches 1..100 run scoreboard players remove @s clear_flagging_tape_timer 20

# set disto swaphands timer if unset
execute as @a unless score @s disto_swaphands_timer matches 0..5 run scoreboard players set @s disto_swaphands_timer 0

# clear placed entities if block broken
execute as @a at @e[tag=witeout_blot_placed_target_pos,type=marker,distance=..300] if block ^ ^ ^0.01 #survey:raycast_transparent run function survey:witeout/break
execute as @a at @e[tag=flagging_tape_placed_target_pos,type=marker,distance=..300] if block ^ ^ ^0.001 #survey:raycast_transparent run function survey:flagging_tape/break

# loop function every 20 ticks
schedule function survey:general/loop_20t 20t