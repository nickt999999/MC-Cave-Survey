# update distance objectives
scoreboard players operation #survey disto_forwards_raycast_steps = #survey disto_intended_origin_forwards_raycast_steps
scoreboard players operation #survey disto_backwards_raycast_steps = #survey disto_raycast_steps
# update shot target marker position
execute at @e[tag=disto_target_pos,type=marker,distance=..260] run tp @e[tag=disto_target_pos,distance=..0.01,type=marker] @e[tag=disto_intended_target_pos,distance=..0.01,type=marker,limit=1]