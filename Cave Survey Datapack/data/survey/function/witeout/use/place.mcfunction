# spawn witeout blot
summon block_display ~ ~ ~ {Tags:["witeout_blot","survey_datapack"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],scale:[0.1f,0.1f,0.1f],translation:[-0.05f,-0.05f,-0.05f]},block_state:{Name:white_concrete}}
# spawn witeout blot target position marker
summon marker ~ ~ ~ {Tags:["witeout_blot_placed_target_pos","survey_datapack"]}
tp @e[tag=witeout_blot_placed_target_pos,sort=nearest,limit=1,type=marker,distance=..0.1] ~ ~ ~ ~ ~

# damage item if survival/adventure mode
execute unless entity @s[gamemode=creative] run function survey:witeout/item/damage with storage survey:data witeout