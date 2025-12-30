# spawn raycast target position marker
kill @e[tag=survey.disto.raycast_target_pos,type=marker,distance=..260]
summon marker ~ ~ ~ {Tags:["survey.disto.raycast_target_pos","survey"]}
tp @e[tag=survey.disto.raycast_target_pos,type=marker,distance=..0.1] ~ ~ ~ ~ ~