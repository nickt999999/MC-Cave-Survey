# reset player cooldown objective
execute store result score #survey witeout_cooldown_gametime run time query gametime
execute as @a if score @s witeout_cooldown_gametime <= #survey witeout_cooldown_gametime run scoreboard players reset @s witeout_cooldown_gametime