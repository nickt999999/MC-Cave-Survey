# store slot in storage path
$data modify storage survey:data disto.shot.slot set value $(slot)
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

# TEMP coord debug
kill @e[tag=dist_origin]
kill @e[tag=dist_target]
execute if data storage survey:data {disto:{shot:{origin:"center"}}} positioned ~ ~0.9 ~ facing entity @e[tag=disto_target_pos,type=marker,distance=..260] eyes run summon marker ~ ~ ~ {Tags:["dist_origin"]}
execute if data storage survey:data {disto:{shot:{origin:"witeout"}}} positioned ~ ~0.9 ~ at @e[tag=witeout_blot,distance=..1.5,sort=nearest,limit=1,type=block_display] facing entity @e[tag=disto_target_pos,type=marker,distance=..260] eyes run summon marker ~ ~ ~ {Tags:["dist_origin"]}
execute at @e[tag=raycast_target_pos,type=marker,distance=..260] run summon marker ~ ~ ~ {Tags:["dist_target"]}

# set shot marker positions
function survey:disto/use/set_shot_marker_pos
# calculate shot output
function survey:disto/use/calculate_output
# TEMP coord debug
kill @e[tag=ang_origin]
kill @e[tag=ang_target]
execute at @e[tag=disto_origin_pos,limit=1,type=marker,distance=..4] run summon marker ~ ~ ~ {Tags:["ang_origin","survey_datapack"]}
execute as @e[tag=ang_origin] at @s run tp @s ~ ~ ~ facing entity @e[tag=disto_target_pos,limit=1]
execute at @e[tag=disto_target_pos,limit=1,type=marker,distance=..260] run summon marker ~ ~ ~ {Tags:["ang_target","survey_datapack"]}

# display disto effects and output
function survey:disto/use/display_shot

# remove raycast tag
tag @s remove self
# remove position markers
kill @e[tag=raycast_target_pos,type=marker,distance=..260]
kill @e[tag=disto_target_pos,type=marker,distance=..260]
kill @e[tag=disto_origin_pos,type=marker,distance=..4]
kill @e[tag=disto_range_test_pos,type=marker,distance=..260]
kill @e[tag=disto_intended_target_pos,type=marker,distance=..260]
kill @e[tag=align_pos,type=marker,distance=..260]
# set item cooldown counter
scoreboard players set @s disto_cooldown 20