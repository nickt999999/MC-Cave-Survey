# end raycast if block
execute unless block ~ ~ ~ #survey:raycast_transparent positioned ^ ^ ^-0.25 run return run function survey:headlamp/raycast/end
# end raycast if entity hitbox
execute positioned ~0.0001 ~0.0001 ~0.0001 as @e[dx=0,tag=!self,type=!marker,distance=..30] positioned ~-1 ~-1 ~-1 if entity @s[dx=0,distance=..30] positioned ~0.9999 ~0.9999 ~0.9999 run return run function survey:headlamp/raycast/end
# end raycast if 75m range limit reached
execute if score #survey headlamp_raycast_steps matches 300 run return run function survey:headlamp/raycast/end
# increment raycast step counter 
scoreboard players add #survey headlamp_raycast_steps 1
# loop raycast forwards
execute positioned ^ ^ ^0.25 run function survey:headlamp/raycast/raycast_spot_loop