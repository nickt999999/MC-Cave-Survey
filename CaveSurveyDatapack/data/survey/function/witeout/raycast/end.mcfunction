# store raycast result in storage path
$data modify storage survey:data witeout.raycast_result set value $(raycast_result)
# spawn raycast target marker if valid result
execute if data storage survey:data {witeout:{raycast_result:"block"}} run function survey:witeout/raycast/spawn_target_marker
execute if data storage survey:data {witeout:{raycast_result:"witeout"}} run function survey:witeout/raycast/spawn_target_marker