# store slot and item in storage path
$data modify storage survey:data flagging_tape.slot set value $(slot)
# TEMP - check if slot is needed in storage path
$data modify storage survey:data flagging_tape.item set value '$(item)'

# 4.5-5m range raycast if player right click item or item text written
execute if score @s click_writable_book matches 1.. run function survey:flagging_tape/use/raycast
execute unless score @s click_writable_book matches 1.. if function survey:flagging_tape/text_check/if_text_written run function survey:flagging_tape/use/raycast

# break flagging tape if player right click item and raycast hits flagging tape
execute if score @s click_writable_book matches 1.. if data storage survey:data {flagging_tape:{raycast_result:"flagging_tape"}} at @e[tag=flagging_tape_target_pos,type=marker,distance=..10] run function survey:flagging_tape/break

# new 4.5-5m range raycast if player break flagging tape and valid item text written
execute if score @s click_writable_book matches 1.. if data storage survey:data {flagging_tape:{raycast_result:"flagging_tape"}} if function survey:flagging_tape/text_check/if_text_written if function survey:flagging_tape/text_check/if_valid_text run function survey:flagging_tape/use/raycast

# place flagging tape if valid item text written and raycast hits block
execute if function survey:flagging_tape/text_check/if_text_written if function survey:flagging_tape/text_check/if_valid_text if data storage survey:data {flagging_tape:{raycast_result:"block"}} at @e[tag=flagging_tape_target_pos,type=marker,distance=..10,limit=1] run function survey:flagging_tape/use/place
# update item if item text written
execute if function survey:flagging_tape/text_check/if_text_written run function survey:flagging_tape/item/update

# remove raycast tag and marker
tag @s remove self
kill @e[tag=flagging_tape_target_pos,type=marker,distance=..10]