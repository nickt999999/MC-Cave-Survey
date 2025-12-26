## from #minecraft:load

# add general objectives
scoreboard objectives add survey.-1 dummy
scoreboard objectives add survey.10 dummy
scoreboard objectives add survey.100 dummy
scoreboard objectives add survey.1000 dummy
scoreboard objectives add survey.max_command_sequence_length dummy
scoreboard objectives add survey.click_writable_book minecraft.used:minecraft.writable_book
scoreboard objectives add survey.uninstall_timer dummy
scoreboard objectives add survey.current_gametime dummy
scoreboard objectives add survey.last_gametime dummy
scoreboard objectives add survey.gametime_change dummy
# add command objectives
scoreboard objectives add survey.clear_flagging_tape trigger
scoreboard objectives add survey.clear_witeout trigger
scoreboard objectives add survey.give_disto trigger
scoreboard objectives add survey.give_flagging_tape trigger
scoreboard objectives add survey.give_headlamp trigger
scoreboard objectives add survey.give_witeout trigger
scoreboard objectives add survey.help trigger
scoreboard objectives add survey.uninstall trigger
# add disto objectives
scoreboard objectives add survey.disto.id_counter dummy
scoreboard objectives add survey.disto.swaphands_timer dummy
scoreboard objectives add survey.disto.change_backsight_mode_timer dummy
scoreboard objectives add survey.disto.cooldown_gametime dummy
scoreboard objectives add survey.disto.triple_shot_beep_gametime dummy
scoreboard objectives add survey.disto.raycast_steps dummy
scoreboard objectives add survey.disto.forwards_raycast_steps dummy
scoreboard objectives add survey.disto.backwards_raycast_steps dummy
scoreboard objectives add survey.disto.intended_origin_forwards_raycast_steps dummy
scoreboard objectives add survey.disto.range dummy
scoreboard objectives add survey.disto.forwards_raycast_step_limit dummy
scoreboard objectives add survey.disto.align_pos_x dummy
scoreboard objectives add survey.disto.align_pos_y dummy
scoreboard objectives add survey.disto.align_pos_z dummy
scoreboard objectives add survey.disto.align_pos_x_decimal_3 dummy
scoreboard objectives add survey.disto.align_pos_y_decimal_3 dummy
scoreboard objectives add survey.disto.align_pos_z_decimal_3 dummy
scoreboard objectives add survey.disto.inclination dummy
scoreboard objectives add survey.disto.inclination_abs dummy
scoreboard objectives add survey.disto.inclination_whole dummy
scoreboard objectives add survey.disto.inclination_decimal_1 dummy
scoreboard objectives add survey.disto.inclination_decimal_2 dummy
scoreboard objectives add survey.disto.inclination_decimal_3 dummy
scoreboard objectives add survey.disto.azimuth dummy
scoreboard objectives add survey.disto.azimuth_whole dummy
scoreboard objectives add survey.disto.azimuth_decimal_1 dummy
scoreboard objectives add survey.disto.azimuth_decimal_2 dummy
scoreboard objectives add survey.disto.azimuth_decimal_3 dummy
scoreboard objectives add survey.disto.forwards_distance dummy
scoreboard objectives add survey.disto.backwards_distance dummy
scoreboard objectives add survey.disto.distance dummy
scoreboard objectives add survey.disto.distance_whole dummy
scoreboard objectives add survey.disto.distance_decimal_1 dummy
scoreboard objectives add survey.disto.distance_decimal_2 dummy
scoreboard objectives add survey.disto.distance_decimal_3 dummy
scoreboard objectives add survey.disto.inclination_history_1 dummy
scoreboard objectives add survey.disto.inclination_history_2 dummy
scoreboard objectives add survey.disto.inclination_history_3 dummy
scoreboard objectives add survey.disto.azimuth_history_1 dummy
scoreboard objectives add survey.disto.azimuth_history_2 dummy
scoreboard objectives add survey.disto.azimuth_history_3 dummy
scoreboard objectives add survey.disto.distance_history_1 dummy
scoreboard objectives add survey.disto.distance_history_2 dummy
scoreboard objectives add survey.disto.distance_history_3 dummy
scoreboard objectives add survey.disto.error dummy
# add flagging tape objectives
scoreboard objectives add survey.flagging_tape.raycast_steps dummy
scoreboard objectives add survey.flagging_tape.x dummy
scoreboard objectives add survey.flagging_tape.y dummy
scoreboard objectives add survey.flagging_tape.z dummy
scoreboard objectives add survey.flagging_tape.x_decimal dummy
scoreboard objectives add survey.flagging_tape.y_decimal dummy
scoreboard objectives add survey.flagging_tape.z_decimal dummy
scoreboard objectives add survey.flagging_tape.player_azimuth dummy
scoreboard objectives add survey.flagging_tape.text_length dummy
scoreboard objectives add survey.flagging_tape.char_start_index dummy
scoreboard objectives add survey.flagging_tape.char_end_index dummy
scoreboard objectives add survey.flagging_tape.damage dummy
scoreboard objectives add survey.flagging_tape.clear_timer dummy
scoreboard objectives add survey.flagging_tape.count dummy
# add headlamp objective
scoreboard objectives add survey.headlamp.raycast_steps dummy
# add witeout objectives
scoreboard objectives add survey.witeout.cooldown_gametime dummy
scoreboard objectives add survey.witeout.raycast_steps dummy
scoreboard objectives add survey.witeout.damage dummy
scoreboard objectives add survey.witeout.clear_timer dummy
scoreboard objectives add survey.witeout.blot_count dummy

# set constant objectives
scoreboard players set #survey survey.-1 -1
scoreboard players set #survey survey.10 10
scoreboard players set #survey survey.100 100
scoreboard players set #survey survey.1000 1000
# set initial disto id counter
execute store result score #survey survey.disto.id_counter run random value 0..2147483646
# revoke advancements
advancement revoke @a only survey:add_flagging_tape_to_chiseled_bookshelf
advancement revoke @a only survey:rclick_disto
advancement revoke @a only survey:rclick_witeout

# start 20t loop
schedule function survey:loop_20t 20t