# cancel uninstall if confirm command not used
execute unless score @s survey.uninstall_timer matches 1..300 run tellraw @s [{"text":"["},{"text":"SURVEY","color":"red"},{"text":"] "},{"text":"Use ","color":"red"},{"text":"/trigger survey.uninstall","color":"yellow","click_event":{"action":"suggest_command","command":"/trigger survey.uninstall"}},{"text":" or "},{"text":"/function survey:command/uninstall","color":"yellow","click_event":{"action":"suggest_command","command":"/function survey:command/uninstall"}},{"text":" to uninstall Cave Survey datapack", "color":"red"}]
execute unless score @s survey.uninstall_timer matches 1..300 run return 0

# remove general objectives
scoreboard objectives remove survey.-1
scoreboard objectives remove survey.10
scoreboard objectives remove survey.100
scoreboard objectives remove survey.1000
scoreboard objectives remove survey.max_command_sequence_length
scoreboard objectives remove survey.click_writable_book
scoreboard objectives remove survey.uninstall_timer
scoreboard objectives remove survey.current_gametime
scoreboard objectives remove survey.last_gametime
scoreboard objectives remove survey.gametime_change
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
scoreboard objectives remove survey.disto.id_counter
scoreboard objectives remove survey.disto.swaphands_timer
scoreboard objectives remove survey.disto.change_backsight_mode_timer
scoreboard objectives remove survey.disto.cooldown_gametime
scoreboard objectives remove survey.disto.triple_shot_beep_gametime
scoreboard objectives remove survey.disto.raycast_steps
scoreboard objectives remove survey.disto.forwards_raycast_steps
scoreboard objectives remove survey.disto.backwards_raycast_steps
scoreboard objectives remove survey.disto.intended_origin_forwards_raycast_steps
scoreboard objectives remove survey.disto.range
scoreboard objectives remove survey.disto.forwards_raycast_step_limit
scoreboard objectives remove survey.disto.align_pos_x
scoreboard objectives remove survey.disto.align_pos_y
scoreboard objectives remove survey.disto.align_pos_z
scoreboard objectives remove survey.disto.align_pos_x_decimal_3
scoreboard objectives remove survey.disto.align_pos_y_decimal_3
scoreboard objectives remove survey.disto.align_pos_z_decimal_3
scoreboard objectives remove survey.disto.inclination
scoreboard objectives remove survey.disto.inclination_abs
scoreboard objectives remove survey.disto.inclination_whole
scoreboard objectives remove survey.disto.inclination_decimal_1
scoreboard objectives remove survey.disto.inclination_decimal_2
scoreboard objectives remove survey.disto.inclination_decimal_3
scoreboard objectives remove survey.disto.azimuth
scoreboard objectives remove survey.disto.azimuth_whole
scoreboard objectives remove survey.disto.azimuth_decimal_1
scoreboard objectives remove survey.disto.azimuth_decimal_2
scoreboard objectives remove survey.disto.azimuth_decimal_3
scoreboard objectives remove survey.disto.forwards_distance
scoreboard objectives remove survey.disto.backwards_distance
scoreboard objectives remove survey.disto.distance
scoreboard objectives remove survey.disto.distance_whole
scoreboard objectives remove survey.disto.distance_decimal_1
scoreboard objectives remove survey.disto.distance_decimal_2
scoreboard objectives remove survey.disto.distance_decimal_3
scoreboard objectives remove survey.disto.inclination_history_1
scoreboard objectives remove survey.disto.inclination_history_2
scoreboard objectives remove survey.disto.inclination_history_3
scoreboard objectives remove survey.disto.azimuth_history_1
scoreboard objectives remove survey.disto.azimuth_history_2
scoreboard objectives remove survey.disto.azimuth_history_3
scoreboard objectives remove survey.disto.distance_history_1
scoreboard objectives remove survey.disto.distance_history_2
scoreboard objectives remove survey.disto.distance_history_3
scoreboard objectives remove survey.disto.error
# remove flagging tape objectives
scoreboard objectives remove survey.flagging_tape.raycast_steps
scoreboard objectives remove survey.flagging_tape.x
scoreboard objectives remove survey.flagging_tape.y
scoreboard objectives remove survey.flagging_tape.z
scoreboard objectives remove survey.flagging_tape.x_decimal
scoreboard objectives remove survey.flagging_tape.y_decimal
scoreboard objectives remove survey.flagging_tape.z_decimal
scoreboard objectives remove survey.flagging_tape.player_azimuth
scoreboard objectives remove survey.flagging_tape.text_length
scoreboard objectives remove survey.flagging_tape.char_start_index
scoreboard objectives remove survey.flagging_tape.char_end_index
scoreboard objectives remove survey.flagging_tape.damage
scoreboard objectives remove survey.flagging_tape.clear_timer
scoreboard objectives remove survey.flagging_tape.count
# remove headlamp objective
scoreboard objectives remove survey.headlamp.raycast_steps
# remove witeout objectives
scoreboard objectives remove survey.witeout.cooldown_gametime
scoreboard objectives remove survey.witeout.raycast_steps
scoreboard objectives remove survey.witeout.damage
scoreboard objectives remove survey.witeout.clear_timer
scoreboard objectives remove survey.witeout.blot_count

# remove tags (online players only)
tag @a remove survey.op
tag @a remove survey.disto.hold_mainhand
tag @a remove survey.disto.hold_offhand
tag @a remove survey.disto.rclick_tick
tag @a remove survey.disto.rclick_hold
tag @a remove survey.disto.triple_shot_beep_center
tag @a remove survey.disto.triple_shot_beep_eyes
tag @s remove survey.disto.triple_shot_beep_witeout
# remove storage data
data remove storage survey:data gametime
data remove storage survey:data disto
data remove storage survey:data flagging_tape
data remove storage survey:data witeout
# remove headlamp light
function survey:headlamp/remove_world_light

# display uninstall text
tellraw @s [{"text":"["},{"text":"SURVEY","color":"red"},{"text":"] "},{"text":"Cave Survey datapack disabled. Use "},{"text":"/datapack enable \"file/CaveSurveyDatapack\"","color":"yellow","click_event":{"action":"suggest_command","command":"/datapack enable \"file/CaveSurveyDatapack\""}},{"text":" to re-enable"}]

# remove debug markers
kill @e[type=marker,tag=survey.debug]
# check for remaining markers
execute if entity @e[type=marker] run tellraw @s [{"text":"["},{"text":"DISTO","color":"red"},{"text":"] [ "},{"text":"Debug","color":"gray"},{"text":"] "},{"text":"Markers detected after uninstall","color":"red"}]

# disable datapack
datapack disable "file/CaveSurveyDatapack"