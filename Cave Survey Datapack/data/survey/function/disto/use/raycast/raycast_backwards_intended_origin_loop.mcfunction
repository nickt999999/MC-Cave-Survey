# end raycast if target marker
execute if entity @e[tag=disto_target_pos,distance=..0.001,type=marker] run return run function survey:disto/use/raycast/end {result:0}
# increment raycast step counter
scoreboard players add #survey disto_raycast_steps 1
# loop raycast backwards
execute positioned ^ ^ ^-0.001 run function survey:disto/use/raycast/raycast_backwards_intended_origin_loop