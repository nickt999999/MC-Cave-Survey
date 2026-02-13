# return true if item text data exists
execute if data storage survey:data {flagging_tape:{slot:"mainhand",item:"minecraft:writable_book"}} if data entity @s SelectedItem.components."minecraft:writable_book_content".pages[0].raw run return 1
execute if data storage survey:data {flagging_tape:{slot:"mainhand",item:"minecraft:written_book"}} if data entity @s SelectedItem.components."minecraft:written_book_content".pages[0].raw run return 1
execute if data storage survey:data {flagging_tape:{slot:"offhand",item:"minecraft:writable_book"}} if data entity @s equipment.offhand.components."minecraft:writable_book_content".pages[0].raw run return 1
execute if data storage survey:data {flagging_tape:{slot:"offhand",item:"minecraft:written_book"}} if data entity @s equipment.offhand.components."minecraft:written_book_content".pages[0].raw run return 1
# else - return false
return 0