# display enable message if storage empty
execute store result score #survey survey.max_command_sequence_length run gamerule max_command_sequence_length
execute unless data storage survey:data gametime run tellraw @a [{"text":"["},{"text":"SURVEY","color":"red"},{"text":"] "},{"text":"Cave Survey datapack enabled. Use "},{"text":"/trigger survey.help","color":"yellow","click_event":{"action":"suggest_command","command":"/trigger survey.help"}},{"text":" for datapack info & commands"}]
execute unless data storage survey:data gametime unless score #survey survey.max_command_sequence_length matches 65536.. run tellraw @a [{"text":"["},{"text":"SURVEY","color":"red"},{"text":"] Low max_command_sequence_length value detected - this may interfere with the Cave Survey datapack. It's reccomended to reset max_command_sequence_length to its default value using "},{"text":"/gamerule max_command_sequence_length 65536","color":"yellow","click_event":{"action":"suggest_command","command":"/gamerule max_command_sequence_length 65536"}}]
# display enable message if datapack previously disabled
execute store result score #survey survey.current_gametime run time query gametime
execute store result score #survey survey.last_gametime run data get storage survey:data gametime
scoreboard players operation #survey survey.gametime_change = #survey survey.current_gametime
scoreboard players operation #survey survey.gametime_change -= #survey survey.last_gametime
execute if data storage survey:data gametime if score #survey survey.gametime_change matches 100.. run tellraw @a [{"text":"["},{"text":"SURVEY","color":"red"},{"text":"] "},{"text":"Cave Survey datapack enabled. Use "},{"text":"/trigger survey.help","color":"yellow","click_event":{"action":"suggest_command","command":"/trigger survey.help"}},{"text":" for datapack info & commands"}]
execute if data storage survey:data gametime if score #survey survey.gametime_change matches 100.. unless score #survey survey.max_command_sequence_length matches 65536.. run tellraw @a [{"text":"["},{"text":"SURVEY","color":"red"},{"text":"] Low max_command_sequence_length value detected - this may interfere with the Cave Survey datapack. It's reccomended to reset max_command_sequence_length to its default value using "},{"text":"/gamerule max_command_sequence_length 65536","color":"yellow","click_event":{"action":"suggest_command","command":"/gamerule max_command_sequence_length 65536"}}]
# store gametime in storage path
execute store result storage survey:data gametime int 1 run time query gametime

# enable help command objective
scoreboard players enable @a survey.help
# enable/disable op command permissions if op tag updated
execute as @a[tag=survey.op] unless score @s survey.clear_flagging_tape matches 0.. run function survey:enable_op_commands
execute as @a[tag=!survey.op] if score @s survey.clear_flagging_tape matches 0.. run function survey:disable_op_commands
# update confirm command timers
execute as @a if score @s survey.flagging_tape.clear_timer matches 1..200 run scoreboard players remove @s survey.flagging_tape.clear_timer 20
execute as @a if score @s survey.witeout.clear_timer matches 1..200 run scoreboard players remove @s survey.witeout.clear_timer 20
execute as @a if score @s survey.uninstall_timer matches 1..300 run scoreboard players remove @s survey.uninstall_timer 20

# give survey recipes
recipe give @a survey:disto
recipe give @a survey:flagging_tape
recipe give @a survey:headlamp
recipe give @a survey:witeout

# set swaphands/backsight timers if unset
execute as @a unless score @s survey.disto.swaphands_timer matches 0..5 run scoreboard players set @s survey.disto.swaphands_timer 0
execute as @a unless score @s survey.disto.change_backsight_mode_timer matches 0..10 run scoreboard players set @s survey.disto.change_backsight_mode_timer 0

# clear witeout and flagging tape entities if block broken
execute as @a at @s at @e[tag=witeout_blot_placed_target_pos,type=marker,distance=..300] if block ^ ^ ^0.01 #survey:raycast_transparent run function survey:witeout/break
execute as @a at @s at @e[tag=flagging_tape_placed_target_pos,type=marker,distance=..300] if block ^ ^ ^0.001 #survey:raycast_transparent run function survey:flagging_tape/use/break

# loop function every 20 ticks
schedule function survey:loop_20t 20t