# cancel uninstall if confirm command not used
execute unless score @s uninstall_timer matches 1..200 run tellraw @s [{"text":"["},{"text":"SURVEY","color":"red"},{"text":"] "},{"text":"Use ","color":"red"},{"text":"/trigger survey.uninstall","color":"yellow","click_event":{"action":"suggest_command","command":"/trigger survey.uninstall"}},{"text":" or "},{"text":"/function survey:command/uninstall","color":"yellow","click_event":{"action":"suggest_command","command":"/function survey:command/uninstall"}},{"text":" to uninstall cave survey datapack", "color":"red"}]
execute unless score @s uninstall_timer matches 1..200 run return 0

# remove general objectives
scoreboard objectives remove -1
scoreboard objectives remove 10
scoreboard objectives remove 20
scoreboard objectives remove 50
scoreboard objectives remove 100
scoreboard objectives remove 1000
scoreboard objectives remove max_command_chain_length
scoreboard objectives remove click_carrot_stick
scoreboard objectives remove click_writable_book
scoreboard objectives remove uninstall_timer
scoreboard objectives remove current_gametime
scoreboard objectives remove last_gametime
scoreboard objectives remove gametime_change
# remove command objectives
scoreboard objectives remove survey.clear_flagging_tape
scoreboard objectives remove survey.clear_witeout
scoreboard objectives remove survey.give_disto
scoreboard objectives remove survey.give_flagging_tape
scoreboard objectives remove survey.give_headlamp
scoreboard objectives remove survey.give_witeout
scoreboard objectives remove survey.help
scoreboard objectives remove survey.uninstall
# remove disto objectives
scoreboard objectives remove disto_raycast_steps
scoreboard objectives remove disto_forwards_raycast_steps
scoreboard objectives remove disto_backwards_raycast_steps
scoreboard objectives remove disto_intended_origin_forwards_raycast_steps
scoreboard objectives remove disto_range
scoreboard objectives remove disto_forwards_raycast_step_limit
scoreboard objectives remove disto_align_pos_x
scoreboard objectives remove disto_align_pos_y
scoreboard objectives remove disto_align_pos_z
scoreboard objectives remove disto_align_pos_x_decimal_3
scoreboard objectives remove disto_align_pos_y_decimal_3
scoreboard objectives remove disto_align_pos_z_decimal_3
scoreboard objectives remove disto_inclination
scoreboard objectives remove disto_inclination_abs
scoreboard objectives remove disto_inclination_whole
scoreboard objectives remove disto_inclination_decimal_1
scoreboard objectives remove disto_inclination_decimal_2
scoreboard objectives remove disto_inclination_decimal_3
scoreboard objectives remove disto_azimuth
scoreboard objectives remove disto_azimuth_whole
scoreboard objectives remove disto_azimuth_decimal_1
scoreboard objectives remove disto_azimuth_decimal_2
scoreboard objectives remove disto_azimuth_decimal_3
scoreboard objectives remove disto_forwards_distance
scoreboard objectives remove disto_backwards_distance
scoreboard objectives remove disto_distance
scoreboard objectives remove disto_distance_whole
scoreboard objectives remove disto_distance_decimal_1
scoreboard objectives remove disto_distance_decimal_2
scoreboard objectives remove disto_distance_decimal_3
scoreboard objectives remove disto_id_counter
scoreboard objectives remove disto_inclination_history_1
scoreboard objectives remove disto_inclination_history_2
scoreboard objectives remove disto_inclination_history_3
scoreboard objectives remove disto_azimuth_history_1
scoreboard objectives remove disto_azimuth_history_2
scoreboard objectives remove disto_azimuth_history_3
scoreboard objectives remove disto_distance_history_1
scoreboard objectives remove disto_distance_history_2
scoreboard objectives remove disto_distance_history_3
scoreboard objectives remove disto_error
scoreboard objectives remove disto_cooldown
scoreboard objectives remove disto_swaphands_timer
# remove witeout objectives
scoreboard objectives remove witeout_raycast_steps
scoreboard objectives remove witeout_damage
scoreboard objectives remove clear_witeout_timer
scoreboard objectives remove witeout_blot_count
# remove flagging tape objectives
scoreboard objectives remove flagging_tape_raycast_steps
scoreboard objectives remove flagging_tape_x
scoreboard objectives remove flagging_tape_y
scoreboard objectives remove flagging_tape_z
scoreboard objectives remove flagging_tape_x_decimal
scoreboard objectives remove flagging_tape_y_decimal
scoreboard objectives remove flagging_tape_z_decimal
scoreboard objectives remove player_azimuth
scoreboard objectives remove flagging_tape_text_length
scoreboard objectives remove flagging_tape_char_start_index
scoreboard objectives remove flagging_tape_char_end_index
scoreboard objectives remove flagging_tape_damage
scoreboard objectives remove clear_flagging_tape_timer
scoreboard objectives remove flagging_tape_count
# remove headlamp objectives
scoreboard objectives remove headlamp_raycast_steps
scoreboard objectives remove place_light_counter_x
scoreboard objectives remove place_light_counter_y
scoreboard objectives remove place_light_counter_z

# remove tags (online players only)
tag @a remove survey_recipes
tag @a remove disto_mainhand
tag @a remove disto_offhand
tag @a remove survey_command
tag @a remove survey.op

# remove storage data
data remove storage survey:data general
data remove storage survey:data disto
data remove storage survey:data witeout
data remove storage survey:data flagging_tape
# remove headlamp light
function survey:headlamp/remove_light

# display uninstall text
tellraw @s [{"text":"["},{"text":"SURVEY","color":"red"},{"text":"] "},{"text":"Cave survey datapack disabled. Use "},{"text":"/datapack enable \"file/Cave Survey Datapack\"","color":"yellow","click_event":{"action":"suggest_command","command":"/datapack enable \"file/Cave Survey Datapack\""}},{"text":" to re-enable"}]

# TEMP debug
kill @e[type=marker,tag=dist_origin]
kill @e[type=marker,tag=dist_target]
kill @e[type=marker,tag=ang_origin]
kill @e[type=marker,tag=ang_target]
execute if entity @e[type=marker] run tellraw @s [{"text":"["},{"text":"DEBUG","color":"red"},{"text":"] "},{"text":"Markers detected after uninstall","color":"red"}]

# disable datapack
datapack disable "file/Cave Survey Datapack"