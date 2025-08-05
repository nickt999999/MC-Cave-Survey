## from #minecraft:load

# add general objectives
scoreboard objectives add -1 dummy
scoreboard objectives add 10 dummy
scoreboard objectives add 20 dummy
scoreboard objectives add 50 dummy
scoreboard objectives add 100 dummy
scoreboard objectives add 1000 dummy
scoreboard objectives add max_command_chain_length dummy
scoreboard objectives add click_writable_book minecraft.used:minecraft.writable_book
scoreboard objectives add uninstall_timer dummy
scoreboard objectives add current_gametime dummy
scoreboard objectives add last_gametime dummy
scoreboard objectives add gametime_change dummy
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
scoreboard objectives add disto_cooldown_gametime dummy
scoreboard objectives add disto_raycast_steps dummy
scoreboard objectives add disto_forwards_raycast_steps dummy
scoreboard objectives add disto_backwards_raycast_steps dummy
scoreboard objectives add disto_intended_origin_forwards_raycast_steps dummy
scoreboard objectives add disto_range dummy
scoreboard objectives add disto_forwards_raycast_step_limit dummy
scoreboard objectives add disto_align_pos_x dummy
scoreboard objectives add disto_align_pos_y dummy
scoreboard objectives add disto_align_pos_z dummy
scoreboard objectives add disto_align_pos_x_decimal_3 dummy
scoreboard objectives add disto_align_pos_y_decimal_3 dummy
scoreboard objectives add disto_align_pos_z_decimal_3 dummy
scoreboard objectives add disto_inclination dummy
scoreboard objectives add disto_inclination_abs dummy
scoreboard objectives add disto_inclination_whole dummy
scoreboard objectives add disto_inclination_decimal_1 dummy
scoreboard objectives add disto_inclination_decimal_2 dummy
scoreboard objectives add disto_inclination_decimal_3 dummy
scoreboard objectives add disto_azimuth dummy
scoreboard objectives add disto_azimuth_whole dummy
scoreboard objectives add disto_azimuth_decimal_1 dummy
scoreboard objectives add disto_azimuth_decimal_2 dummy
scoreboard objectives add disto_azimuth_decimal_3 dummy
scoreboard objectives add disto_forwards_distance dummy
scoreboard objectives add disto_backwards_distance dummy
scoreboard objectives add disto_distance dummy
scoreboard objectives add disto_distance_whole dummy
scoreboard objectives add disto_distance_decimal_1 dummy
scoreboard objectives add disto_distance_decimal_2 dummy
scoreboard objectives add disto_distance_decimal_3 dummy
scoreboard objectives add disto_id_counter dummy
scoreboard objectives add disto_inclination_history_1 dummy
scoreboard objectives add disto_inclination_history_2 dummy
scoreboard objectives add disto_inclination_history_3 dummy
scoreboard objectives add disto_azimuth_history_1 dummy
scoreboard objectives add disto_azimuth_history_2 dummy
scoreboard objectives add disto_azimuth_history_3 dummy
scoreboard objectives add disto_distance_history_1 dummy
scoreboard objectives add disto_distance_history_2 dummy
scoreboard objectives add disto_distance_history_3 dummy
scoreboard objectives add disto_error dummy
# TEMP remove
scoreboard objectives add disto_cooldown dummy
scoreboard objectives add disto_swaphands_timer dummy
# add witeout objectives
scoreboard objectives add witeout_cooldown_gametime dummy
scoreboard objectives add witeout_raycast_steps dummy
scoreboard objectives add witeout_damage dummy
scoreboard objectives add clear_witeout_timer dummy
scoreboard objectives add witeout_blot_count dummy
# add flagging tape objectives
scoreboard objectives add flagging_tape_raycast_steps dummy
scoreboard objectives add flagging_tape_x dummy
scoreboard objectives add flagging_tape_y dummy
scoreboard objectives add flagging_tape_z dummy
scoreboard objectives add flagging_tape_x_decimal dummy
scoreboard objectives add flagging_tape_y_decimal dummy
scoreboard objectives add flagging_tape_z_decimal dummy
scoreboard objectives add player_azimuth dummy
scoreboard objectives add flagging_tape_text_length dummy
scoreboard objectives add flagging_tape_char_start_index dummy
scoreboard objectives add flagging_tape_char_end_index dummy
scoreboard objectives add flagging_tape_damage dummy
scoreboard objectives add clear_flagging_tape_timer dummy
scoreboard objectives add flagging_tape_count dummy
# add headlamp objectives
scoreboard objectives add headlamp_raycast_steps dummy
scoreboard objectives add place_light_counter_x dummy
scoreboard objectives add place_light_counter_y dummy
scoreboard objectives add place_light_counter_z dummy

# set constant objectives
scoreboard players set #survey -1 -1
scoreboard players set #survey 10 10
scoreboard players set #survey 20 20
scoreboard players set #survey 50 50
scoreboard players set #survey 100 100
scoreboard players set #survey 1000 1000
# set initial disto id counter
execute store result score #survey disto_id_counter run random value 0..2147483646

# display error message if low maxCommandChainLength
execute store result score @p max_command_chain_length run gamerule maxCommandChainLength
execute unless score @p max_command_chain_length matches 65536.. run tellraw @a [{"text":"["},{"text":"SURVEY","color":"red"},{"text":"] "},{"text":"Low maxCommandChainLength value detected - this may interfere with the cave survey datapack. It's reccomended to reset maxCommandChainLength to its default value using ","color":"red"},{"text":"/gamerule maxCommandChainLength 65536","color":"yellow","click_event":{"action":"suggest_command","command":"/gamerule maxCommandChainLength 65536"}}]
scoreboard players reset @p max_command_chain_length

# start 20t loop
schedule function survey:general/loop_20t 20t