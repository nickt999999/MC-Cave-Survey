# display grant op message
tellraw @s [{"text":"["},{"text":"SURVEY","color":"red"},{"text":"] Datapack /trigger command permissions granted"}]

# enable op command objectives
scoreboard players enable @s survey.clear_flagging_tape
scoreboard players enable @s survey.clear_witeout
scoreboard players enable @s survey.give_disto
scoreboard players enable @s survey.give_flagging_tape
scoreboard players enable @s survey.give_headlamp
scoreboard players enable @s survey.give_witeout
scoreboard players enable @s survey.uninstall