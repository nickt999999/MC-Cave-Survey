# spawn raycast target position marker
kill @e[tag=flagging_tape_target_pos,type=marker,distance=..10]
summon marker ~ ~ ~ {Tags:["flagging_tape_target_pos","survey_datapack"]}
tp @e[tag=flagging_tape_target_pos,type=marker,distance=..10] ~ ~ ~ ~ ~