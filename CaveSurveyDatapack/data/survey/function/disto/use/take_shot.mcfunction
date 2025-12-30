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

# remove debug markers
kill @e[tag=survey.debug,type=marker]
# spawn position debug markers for distance calculation (unaligned)
execute if data storage survey:data {disto:{shot:{origin:"center"}}} positioned ~ ~0.9 ~ facing entity @e[tag=disto_target_pos,limit=1,type=marker,distance=..260] eyes run summon marker ~ ~ ~ {Tags:["survey.disto.distance_origin","survey.debug","survey"]}
execute if data storage survey:data {disto:{shot:{origin:"eyes"}}} anchored eyes positioned ^ ^ ^ facing entity @e[tag=survey.disto.target_pos,limit=1,type=marker,distance=..260] eyes run summon marker ~ ~ ~ {Tags:["survey.disto.distance_origin","survey.debug","survey"]}
execute if data storage survey:data {disto:{shot:{origin:"witeout"}}} positioned ~ ~0.9 ~ at @e[tag=survey.witeout.entity,distance=..1.5,limit=1,type=block_display] facing entity @e[tag=survey.disto.target_pos,limit=1,type=marker,distance=..260] eyes run summon marker ~ ~ ~ {Tags:["survey.disto.distance_origin","survey.debug","survey"]}
execute at @e[tag=survey.disto.raycast_target_pos,type=marker,distance=..260] run summon marker ~ ~ ~ {Tags:["survey.disto.distance_target","survey.debug","survey"]}
# set shot marker positions for angle calculation
function survey:disto/use/set_shot_marker_pos
# spawn position debug markers for angle calculation (aligned)
execute at @e[tag=disto_origin_pos,limit=1,type=marker,distance=..4] run summon marker ~ ~ ~ {Tags:["survey.disto.angle_origin","survey.debug","survey"]}
execute as @e[tag=survey.disto.angle_origin_pos] at @s run tp @s ~ ~ ~ facing entity @e[tag=disto_target_pos,limit=1,type=marker,distance=..260]
execute at @e[tag=disto_target_pos,limit=1,type=marker,distance=..260] run summon marker ~ ~ ~ {Tags:["survey.disto.angle_target","survey.debug","survey"]}
# calculate shot output
function survey:disto/use/calculate_output
# display disto effects and output
function survey:disto/use/display_shot

# remove raycast tag
tag @s remove survey.self
# remove position markers
kill @e[tag=survey.disto.raycast_target_pos,type=marker,distance=..260]
kill @e[tag=survey.disto.target_pos,type=marker,distance=..260]
kill @e[tag=survey.disto.origin_pos,type=marker,distance=..4]
kill @e[tag=survey.disto.range_test_pos,type=marker,distance=..260]
kill @e[tag=survey.disto.intended_target_pos,type=marker,distance=..260]
kill @e[tag=survey.disto.align_pos,type=marker,distance=..260]