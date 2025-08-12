# end raycast if no entity hitbox
execute positioned ~0.0001 ~0.0001 ~0.0001 unless entity @e[dx=0,tag=!self,type=!marker,distance=..30] positioned ~-0.0001 ~-0.0001 ~-0.0001 run return run function survey:disto/use/raycast/end {result:0}
execute positioned ~0.0001 ~0.0001 ~0.0001 as @e[dx=0,tag=!self,type=!marker,distance=..30] positioned ~-1 ~-1 ~-1 unless entity @s[dx=0,distance=..30] positioned ~0.9999 ~0.9999 ~0.9999 run return run function survey:disto/use/raycast/end {result:0}
# increment raycast step counter
scoreboard players add #survey survey.disto.raycast_steps 1
# loop raycast backwards
execute positioned ^ ^ ^-0.001 run function survey:disto/use/raycast/raycast_backwards_entity_eyes_origin_loop