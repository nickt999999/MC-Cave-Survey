# set triple shot origin tag
execute if data storage survey:data {disto:{shot:{origin:"center"}}} run tag @s add disto_triple_shot_beep_center
execute if data storage survey:data {disto:{shot:{origin:"eyes"}}} run tag @s add disto_triple_shot_beep_eyes
execute if data storage survey:data {disto:{shot:{origin:"witeout"}}} run tag @s add disto_triple_shot_beep_witeout
# schedule second beep
schedule function survey:disto/use/triple_shot/play_beep 3t