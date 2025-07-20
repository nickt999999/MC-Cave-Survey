# spawn raycast target position marker
kill @e[tag=witeout_target_pos,type=marker,distance=..10]
summon marker ~ ~ ~ {Tags:["witeout_target_pos","survey_datapack"]}
tp @e[tag=witeout_target_pos,type=marker,distance=..0.1] ~ ~ ~ ~ ~