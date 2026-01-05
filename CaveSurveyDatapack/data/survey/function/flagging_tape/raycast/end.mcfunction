# store raycast result in storage path
$data modify storage survey:data flagging_tape.raycast_result set value $(raycast_result)
# spawn raycast target marker if valid result
execute if data storage survey:data {flagging_tape:{raycast_result:"block"}} run function survey:flagging_tape/raycast/spawn_target_marker
execute if data storage survey:data {flagging_tape:{raycast_result:"flagging_tape"}} run function survey:flagging_tape/raycast/spawn_target_marker