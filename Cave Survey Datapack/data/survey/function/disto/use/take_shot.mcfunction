# raycast from player's eyes
execute anchored eyes positioned ^ ^ ^ run function survey:disto/use/eyes_origin/raycast

# store intended shot origin in storage path
function survey:disto/use/intended_origin/store_origin
# raycast from intended shot origin position to eyes raycast target position
execute unless data storage survey:data {disto:{shot:{origin:"eyes"}}} if data storage survey:data {disto:{shot:{shot_in_range:1b}}} run function survey:disto/use/intended_origin/raycast
# update raycast target if no intersect between positions
execute unless data storage survey:data {disto:{shot:{origin:"eyes"}}} unless data storage survey:data {disto:{shot:{raycast:{result:"shot_intersect"}}}} run function survey:disto/use/intended_origin/update_shot_target
# set shot origin to player's eyes if intersect between positions
execute unless data storage survey:data {disto:{shot:{origin:"eyes"}}} if data storage survey:data {disto:{shot:{raycast:{result:"shot_intersect"}}}} run data modify storage survey:data disto.shot.origin set value "eyes"

# set shot marker positions
function survey:disto/use/set_shot_marker_pos
# calculate shot output
function survey:disto/use/calculate_output

# display disto effects and output
function survey:disto/use/display_shot

# remove raycast tag
tag @s remove self
# remove position markers
kill @e[tag=raycast_target_pos,type=marker,distance=..260]
kill @e[tag=disto_target_pos,type=marker,distance=..260]
kill @e[tag=disto_origin_pos,type=marker,distance=..4]
kill @e[tag=survey.disto.range_test_pos,type=marker,distance=..260]
kill @e[tag=disto_intended_target_pos,type=marker,distance=..260]
kill @e[tag=align_pos,type=marker,distance=..260]