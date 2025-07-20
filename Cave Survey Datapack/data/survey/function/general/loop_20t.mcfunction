# display enable message on first tick
execute unless data storage survey:data {general:{sent_enable_message:1b}} run tellraw @a [{"text":"["},{"text":"SURVEY","color":"red"},{"text":"] "},{"text":"Cave survey datapack enabled. Use "},{"text":"/function survey:command/help","color":"yellow","click_event":{"action":"suggest_command","command":"/function survey:command/help"}},{"text":" for info & datapack commands"}]
data modify storage survey:data general.sent_enable_message set value 1b

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