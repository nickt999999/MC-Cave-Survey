# set target position along player's line of sight
summon marker ~ ~ ~ {Tags:["survey.disto.target_pos","survey"]}
$tp @e[tag=survey.disto.target_pos,type=marker,distance=..260] ^ ^ ^$(range)