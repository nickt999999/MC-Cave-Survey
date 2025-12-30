# end raycast if target marker
execute if entity @e[tag=survey.disto.target_pos,distance=..0.05,type=marker] run return run function survey:disto/use/raycast/end {result:"eyes_target"}
# end raycast if entity hitbox
execute positioned ~0.0001 ~0.0001 ~0.0001 as @e[dx=0,tag=!survey.self,type=!marker,distance=..30] positioned ~-1 ~-1 ~-1 if entity @s[dx=0,distance=..30] positioned ~0.9999 ~0.9999 ~0.9999 run return run function survey:disto/use/raycast/end {result:"shot_intersect"}
# end raycast if block
execute unless block ~ ~ ~ #survey:raycast_transparent run return run function survey:disto/use/raycast/end {result:"shot_intersect"}
# increment raycast step counter
scoreboard players add #survey survey.disto.raycast_steps 1
# loop raycast forwards
execute facing entity @e[tag=survey.disto.target_pos,limit=1,type=marker,distance=..260] eyes positioned ^ ^ ^0.1 run function survey:disto/use/raycast/raycast_forwards_intended_origin_loop