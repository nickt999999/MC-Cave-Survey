# end raycast if block
execute unless block ~ ~ ~ #survey:raycast_transparent positioned ^ ^ ^-0.01 run return run function survey:witeout/raycast/end {raycast_result:"block"}
# end raycast if witeout blot
execute at @e[tag=witeout_blot,distance=..0.1,type=block_display] run return run function survey:witeout/raycast/end {raycast_result:"witeout"}
# end raycast if entity hitbox
execute positioned ~0.0001 ~0.0001 ~0.0001 as @e[dx=0,tag=!self,type=!marker,distance=..30] positioned ~-1 ~-1 ~-1 if entity @s[dx=0,distance=..30] run return run function survey:witeout/raycast/end {raycast_result:"entity"}
# end raycast if range limit reached
execute if score #survey witeout_raycast_steps matches 500 run return run function survey:witeout/raycast/end {raycast_result:"range_limit"}
# increment raycast step counter
scoreboard players add #survey witeout_raycast_steps 1
# loop raycast forwards
execute positioned ^ ^ ^0.01 run function survey:witeout/raycast/raycast_loop