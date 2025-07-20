# spawn raycast target position marker
kill @e[tag=raycast_target_pos,type=marker,distance=..260]
summon marker ~ ~ ~ {Tags:["raycast_target_pos","survey_datapack"]}
tp @e[tag=raycast_target_pos,type=marker,distance=..0.1] ~ ~ ~ ~ ~