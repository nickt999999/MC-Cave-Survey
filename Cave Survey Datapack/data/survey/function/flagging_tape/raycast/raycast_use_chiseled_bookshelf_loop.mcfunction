# end raycast if bookshelf block
execute if block ~ ~ ~ minecraft:chiseled_bookshelf if data block ~ ~ ~ Items[{components:{"minecraft:custom_data":{flagging_tape:1b}}}] run return run summon minecraft:marker ~ ~ ~ {Tags:["chiseled_bookshelf_pos","survey_datapack"]}
# end raycast if range limit reached
execute if score #survey flagging_tape_raycast_steps matches 500 run return 0
# increment step counter
scoreboard players add #survey flagging_tape_raycast_steps 1
# loop raycast forwards
execute positioned ^ ^ ^0.01 run function survey:flagging_tape/raycast/raycast_use_chiseled_bookshelf_loop