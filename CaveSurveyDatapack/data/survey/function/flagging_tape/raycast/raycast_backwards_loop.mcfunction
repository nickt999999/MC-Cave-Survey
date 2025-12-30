# end raycast if empty block
execute if block ~ ~ ~ #survey:item_raycast_transparent run return run function survey:flagging_tape/raycast/end {raycast_result:"block"}
# loop raycast backwards
execute positioned ^ ^ ^-0.001 run function survey:flagging_tape/raycast/raycast_backwards_loop