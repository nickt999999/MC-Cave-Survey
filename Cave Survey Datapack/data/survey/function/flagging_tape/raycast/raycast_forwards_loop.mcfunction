# end raycast if block
execute unless block ~ ~ ~ #survey:raycast_transparent run return run function survey:flagging_tape/raycast/end {raycast_result:"block"}
# end raycast if flagging tape
execute if entity @e[tag=flagging_tape,distance=..0.15,type=text_display] run return run function survey:flagging_tape/raycast/end {raycast_result:"flagging_tape"}
# end raycast if entity hitbox
execute positioned ~0.0001 ~0.0001 ~0.0001 as @e[dx=0,tag=!self,type=!marker,distance=..30] positioned ~-1 ~-1 ~-1 if entity @s[dx=0,distance=..30] run return run function survey:flagging_tape/raycast/end {raycast_result:"entity"}
# end raycast if 5m range limit reached
execute if score #survey flagging_tape_raycast_steps matches 100 run return run function survey:flagging_tape/raycast/end {raycast_result:"range_limit"}
# increment step counter
scoreboard players add #survey flagging_tape_raycast_steps 1
# loop raycast forwards
execute positioned ^ ^ ^0.05 run function survey:flagging_tape/raycast/raycast_forwards_loop