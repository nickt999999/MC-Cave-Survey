# spawn raycast target position marker
kill @e[tag=survey.witeout.target_pos,type=marker,distance=..10]
summon marker ~ ~ ~ {Tags:["survey.witeout.target_pos","survey"]}
tp @e[tag=survey.witeout.target_pos,type=marker,distance=..0.1] ~ ~ ~ ~ ~