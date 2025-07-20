# set target position along player's line of sight
summon marker ~ ~ ~ {Tags:["disto_target_pos","survey_datapack"]}
$tp @e[tag=disto_target_pos,type=marker,distance=..260] ^ ^ ^$(range)