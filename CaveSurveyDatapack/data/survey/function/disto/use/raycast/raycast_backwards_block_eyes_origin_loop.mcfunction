# end raycast if empty block
execute if block ~ ~ ~ #survey:beam_raycast_transparent run return run function survey:disto/use/raycast/end {result:0}
# increment raycast step counter
scoreboard players add #survey survey.disto.raycast_steps 1
# loop raycast backwards
execute positioned ^ ^ ^-0.001 run function survey:disto/use/raycast/raycast_backwards_block_eyes_origin_loop