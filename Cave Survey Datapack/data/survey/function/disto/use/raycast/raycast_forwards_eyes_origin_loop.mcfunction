# end raycast if block
execute unless block ~ ~ ~ #survey:raycast_transparent run return run function survey:disto/use/raycast/end {result:"block"}
# end raycast if entity hitbox
execute positioned ~0.0001 ~0.0001 ~0.0001 as @e[dx=0,tag=!self,type=!marker,distance=..30] positioned ~-1 ~-1 ~-1 if entity @s[dx=0,distance=..30] positioned ~0.9999 ~0.9999 ~0.9999 run return run function survey:disto/use/raycast/end {result:"entity"}
# end raycast if range limit reached
execute if score #survey disto_raycast_steps = #survey disto_forwards_raycast_step_limit run return run function survey:disto/use/raycast/end {result:"range_limit"}
# increment raycast step counter
scoreboard players add #survey disto_raycast_steps 1
# loop raycast forwards
execute positioned ^ ^ ^0.05 run function survey:disto/use/raycast/raycast_forwards_eyes_origin_loop