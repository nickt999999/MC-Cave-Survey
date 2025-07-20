# display confirm text
execute unless score @s uninstall_timer matches 1..100 run tellraw @s [{"text":"["},{"text":"SURVEY","color":"red"},{"text":"] Uninstall cave survey datapack? Re-ender command to confirm"}]
execute unless score @s uninstall_timer matches 1..100 run tellraw @s [{"text":"["},{"text":"SURVEY","color":"red"},{"text":"] "},{"text":"Uninstalling the datapack disables all datapack functionality. To remove datapack entities (Wite-Out blots & flagging tape pieces), use "},{"text":"/function survey:command/clear_flagging_tape","color":"yellow","click_event":{"action":"suggest_command","command":"/function survey:command/clear_flagging_tape"}},{"text":" and "},{"text":"/function survey:command/clear_witeout","color":"yellow","click_event":{"action":"suggest_command","command":"/function survey:command/clear_witeout"}},{"text":" BEFORE uninstalling the datapack"}]
# uninstall datapack and display uninstall text
execute if score @s uninstall_timer matches 1..100 run function survey:general/uninstall
# update confirm timer
execute unless score @s uninstall_timer matches 1..100 run scoreboard players set @s uninstall_timer 100