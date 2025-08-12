# revoke advancement
advancement revoke @s only survey:add_flagging_tape_to_chiseled_bookshelf

# get block location from 4.5/5m range raycast
execute anchored eyes positioned ^ ^ ^ run function survey:flagging_tape/use_chiseled_bookshelf/raycast
execute unless entity @e[tag=chiseled_bookshelf_pos,type=marker,distance=..10] anchored eyes positioned ^-0.1 ^ ^ run function survey:flagging_tape/use_chiseled_bookshelf/raycast
execute unless entity @e[tag=chiseled_bookshelf_pos,type=marker,distance=..10] anchored eyes positioned ^0.1 ^ ^ run function survey:flagging_tape/use_chiseled_bookshelf/raycast
execute unless entity @e[tag=chiseled_bookshelf_pos,type=marker,distance=..10] anchored eyes positioned ^ ^-0.1 ^ run function survey:flagging_tape/use_chiseled_bookshelf/raycast
execute unless entity @e[tag=chiseled_bookshelf_pos,type=marker,distance=..10] anchored eyes positioned ^ ^0.1 ^ run function survey:flagging_tape/use_chiseled_bookshelf/raycast
# store item data in storage path
execute at @e[tag=chiseled_bookshelf_pos,type=marker,distance=..10] run data modify storage survey:data flagging_tape.chiseled_bookshelf_interaction.slot set from block ~ ~ ~ Items[{components:{"minecraft:custom_data":{flagging_tape:1b}}}].Slot
execute at @e[tag=chiseled_bookshelf_pos,type=marker,distance=..10] run data modify storage survey:data flagging_tape.chiseled_bookshelf_interaction.damage set from block ~ ~ ~ Items[{components:{"minecraft:custom_data":{flagging_tape:1b}}}].components."minecraft:damage"

# give item to player
execute if entity @e[tag=chiseled_bookshelf_pos,type=marker,distance=..10] run function survey:flagging_tape/use_chiseled_bookshelf/give_item with storage survey:data flagging_tape.chiseled_bookshelf_interaction
# remove item from bookshelf
execute at @e[tag=chiseled_bookshelf_pos,type=marker,distance=..10] run function survey:flagging_tape/use_chiseled_bookshelf/remove_block_item with storage survey:data flagging_tape.chiseled_bookshelf_interaction

# remove raycast marker
kill @e[tag=chiseled_bookshelf_pos,type=marker,distance=..10]