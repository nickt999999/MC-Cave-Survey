# reset player cooldown objective
execute store result score #survey survey.general.current_gametime run time query gametime
execute as @a if score @s survey.disto.cooldown_gametime <= #survey survey.general.current_gametime run scoreboard players reset @s survey.disto.cooldown_gametime