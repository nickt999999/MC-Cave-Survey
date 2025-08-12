## from #minecraft:load

# add general objectives
scoreboard objectives add survey.general.-1 dummy
scoreboard objectives add survey.general.10 dummy
scoreboard objectives add survey.general.100 dummy
scoreboard objectives add survey.general.1000 dummy
scoreboard objectives add survey.general.max_command_sequence_length dummy
scoreboard objectives add survey.general.click_writable_book minecraft.used:minecraft.writable_book
scoreboard objectives add survey.general.uninstall_timer dummy
scoreboard objectives add survey.general.current_gametime dummy
scoreboard objectives add survey.general.last_gametime dummy
scoreboard objectives add survey.general.gametime_change dummy
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
scoreboard players set #survey survey.general.-1 -1
scoreboard players set #survey survey.general.10 10
scoreboard players set #survey survey.general.100 100
scoreboard players set #survey survey.general.1000 1000
# set initial disto id counter
execute store result score #survey survey.disto.id_counter run random value 0..2147483646
# revoke advancements
advancement revoke @a only survey:add_flagging_tape_to_chiseled_bookshelf
advancement revoke @a only survey:rclick_disto
advancement revoke @a only survey:rclick_witeout

# display error message if low maxCommandChainLength
execute store result score #survey max_command_chain_length run gamerule maxCommandChainLength
execute unless score #survey max_command_chain_length matches 65536.. run tellraw @a [{"text":"["},{"text":"SURVEY","color":"red"},{"text":"] "},{"text":"Low maxCommandChainLength value detected - this may interfere with the cave survey datapack. It's reccomended to reset maxCommandChainLength to its default value using ","color":"red"},{"text":"/gamerule maxCommandChainLength 65536","color":"yellow","click_event":{"action":"suggest_command","command":"/gamerule maxCommandChainLength 65536"}}]
scoreboard players reset #survey max_command_chain_length

# start 20t loop
schedule function survey:general/loop_20t 20t