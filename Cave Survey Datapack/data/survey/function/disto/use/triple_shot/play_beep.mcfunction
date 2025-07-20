# play second beep
execute as @a[tag=disto_triple_shot_beep_center] at @s run playsound block.note_block.bit master @a ~ ~ ~ 0.5 1.781797
execute as @a[tag=disto_triple_shot_beep_eyes] at @s run playsound block.note_block.bit master @a ~ ~ ~ 0.5 1.587401
execute as @a[tag=disto_triple_shot_beep_witeout] at @s run playsound block.note_block.bit master @a ~ ~ ~ 0.5 2
# remove triple shot origin tag
tag @a[tag=disto_triple_shot_beep_center] remove disto_triple_shot_beep_center
tag @a[tag=disto_triple_shot_beep_eyes] remove disto_triple_shot_beep_eyes
tag @a[tag=disto_triple_shot_beep_witeout] remove disto_triple_shot_beep_witeout