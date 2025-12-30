# end raycast if bookshelf block
execute if block ~ ~ ~ minecraft:chiseled_bookshelf if data block ~ ~ ~ Items[{components:{"minecraft:custom_data":{flagging_tape:1b}}}] run return run summon minecraft:marker ~ ~ ~ {Tags:["survey.flagging_tape.chiseled_bookshelf_pos","survey"]}
# end raycast if range limit reached
execute if score #survey survey.flagging_tape.raycast_steps matches 500 run return 0
# increment step counter
scoreboard players add #survey survey.flagging_tape.raycast_steps 1
# loop raycast forwards
execute positioned ^ ^ ^0.01 run function survey:flagging_tape/raycast/raycast_use_chiseled_bookshelf_loop