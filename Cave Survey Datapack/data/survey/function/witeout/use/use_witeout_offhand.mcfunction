# reset advancement
advancement revoke @s only survey:use_witeout_offhand

# prevent if within cooldown
execute if score @s witeout_cooldown_gametime matches 0.. run return 0

# else - use witeout
data modify storage survey:data witeout.slot set value "offhand"
execute at @s run function survey:witeout/use/use_item

# else - schedule 5 tick cooldown (temp remove?)
execute store result score @s witeout_cooldown_gametime run time query gametime
scoreboard players add @s witeout_cooldown_gametime 5
schedule function survey:witeout/use/disable_cooldown 5t append