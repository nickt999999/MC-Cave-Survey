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

# update player commands, recipes, timers, entities
execute as @a run function survey:update_player_20t