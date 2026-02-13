# display revoke op message
tellraw @s [{"text":"["},{"text":"SURVEY","color":"red"},{"text":"] Datapack /trigger command permissions revoked"}]

# reset op command objectives
scoreboard players reset @s survey.clear_flagging_tape
scoreboard players reset @s survey.clear_witeout
scoreboard players reset @s survey.give_disto
scoreboard players reset @s survey.give_flagging_tape
scoreboard players reset @s survey.give_headlamp
scoreboard players reset @s survey.give_witeout
scoreboard players reset @s survey.uninstall