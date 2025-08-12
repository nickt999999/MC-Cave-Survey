# set triple shot origin tag
execute if data storage survey:data {disto:{shot:{origin:"center"}}} run tag @s add disto_triple_shot_beep_center
execute if data storage survey:data {disto:{shot:{origin:"eyes"}}} run tag @s add disto_triple_shot_beep_eyes
execute if data storage survey:data {disto:{shot:{origin:"witeout"}}} run tag @s add disto_triple_shot_beep_witeout
# schedule second beep in 2 ticks
execute store result score @s survey.disto.triple_shot_beep_gametime run time query gametime
scoreboard players add @s survey.disto.triple_shot_beep_gametime 2
schedule function survey:disto/use/triple_shot/play_beep 2t append