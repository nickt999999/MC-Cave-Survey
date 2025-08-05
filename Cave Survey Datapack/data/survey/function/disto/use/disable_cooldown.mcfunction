# reset player cooldown objective
execute store result score #survey disto_cooldown_gametime run time query gametime
execute as @a if score @s disto_cooldown_gametime <= #survey disto_cooldown_gametime run scoreboard players reset @s disto_cooldown_gametime