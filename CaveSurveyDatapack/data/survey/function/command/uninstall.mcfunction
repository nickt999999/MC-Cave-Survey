# display confirm text
execute unless score @s survey.uninstall_timer matches 1..300 run tellraw @s [{"text":"["},{"text":"SURVEY","color":"red"},{"text":"] Uninstall Cave Survey datapack? Re-ender command to confirm"}]
execute unless score @s survey.uninstall_timer matches 1..300 run tellraw @s [{"text":"["},{"text":"SURVEY","color":"red"},{"text":"] "},{"text":"Uninstalling the datapack disables cave survey functionality and removes datapack components. To remove datapack entities (Wite-Out blots & flagging tape pieces), use "},{"text":"/kill @e[tag=survey]","color":"yellow","click_event":{"action":"suggest_command","command":"/kill @e[tag=survey]"}}]
# uninstall datapack and display uninstall text
execute if score @s survey.uninstall_timer matches 1..300 run function survey:uninstall
# update confirm timer
execute unless score @s survey.uninstall_timer matches 1..300 run scoreboard players set @s survey.uninstall_timer 300

# re-enable command objective
execute if entity @s[tag=survey.op] run scoreboard players enable @s survey.uninstall
execute if entity @s[tag=survey.op] run scoreboard players set @s survey.uninstall 0