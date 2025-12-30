# spawn raycast target position marker
kill @e[tag=survey.flagging_tape.target_pos,type=marker,distance=..10]
summon marker ~ ~ ~ {Tags:["survey.flagging_tape.target_pos","survey"]}
tp @e[tag=survey.flagging_tape.target_pos,type=marker,distance=..10] ~ ~ ~ ~ ~