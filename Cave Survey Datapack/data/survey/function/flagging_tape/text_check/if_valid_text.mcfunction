# store item text in storage path
execute if data storage survey:data {flagging_tape:{slot:"mainhand",item:"writable_book"}} run data modify storage survey:data flagging_tape.item_text set from entity @s SelectedItem.components."minecraft:writable_book_content".pages[0].raw
execute if data storage survey:data {flagging_tape:{slot:"mainhand",item:"written_book"}} run data modify storage survey:data flagging_tape.item_text set from entity @s SelectedItem.components."minecraft:written_book_content".pages[0].raw
execute if data storage survey:data {flagging_tape:{slot:"offhand",item:"writable_book"}} run data modify storage survey:data flagging_tape.item_text set from entity @s equipment.offhand.components."minecraft:writable_book_content".pages[0].raw
execute if data storage survey:data {flagging_tape:{slot:"offhand",item:"written_book"}} run data modify storage survey:data flagging_tape.item_text set from entity @s equipment.offhand.components."minecraft:written_book_content".pages[0].raw
# get text length
execute store result score #survey flagging_tape_text_length run function survey:flagging_tape/text_check/length/get_length
# return false if text exceeds 12 characters
execute if score #survey flagging_tape_text_length matches 13.. run return 0
# return false if text contains \n
execute if function survey:flagging_tape/text_check/newline/if_text_contains_newline run return 0
# else - return true
return 1