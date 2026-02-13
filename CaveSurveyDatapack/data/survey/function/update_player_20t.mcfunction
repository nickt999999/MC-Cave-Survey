# enable help command objective
scoreboard players enable @s survey.help
# enable/disable op command perms if op tag updated
execute if entity @s[tag=survey.op] unless score @s survey.clear_flagging_tape matches 0.. run function survey:enable_op_commands
execute if entity @s[tag=!survey.op] if score @s survey.clear_flagging_tape matches 0.. run function survey:disable_op_commands
# update confirm command timers
execute if score @s survey.flagging_tape.clear_timer matches 1..200 run scoreboard players remove @s survey.flagging_tape.clear_timer 20
execute if score @s survey.witeout.clear_timer matches 1..200 run scoreboard players remove @s survey.witeout.clear_timer 20
execute if score @s survey.uninstall_timer matches 1..300 run scoreboard players remove @s survey.uninstall_timer 20

# give survey recipes
recipe give @s survey:disto
recipe give @s survey:flagging_tape
recipe give @s survey:headlamp
recipe give @s survey:witeout

# set swaphands/backsight timers if unset
execute unless score @s survey.disto.swaphands_timer matches 0..5 run scoreboard players set @s survey.disto.swaphands_timer 0
execute unless score @s survey.disto.change_backsight_mode_timer matches 0..10 run scoreboard players set @s survey.disto.change_backsight_mode_timer 0

# clear witeout and flagging tape entities if block broken
execute at @s at @e[tag=survey.witeout.blot_target_pos,type=marker,distance=..300] if block ^ ^ ^0.01 #survey:item_raycast_transparent run function survey:witeout/break
execute at @s at @e[tag=survey.flagging_tape.piece_target_pos,type=marker,distance=..300] if block ^ ^ ^0.001 #survey:item_raycast_transparent run function survey:flagging_tape/use/break