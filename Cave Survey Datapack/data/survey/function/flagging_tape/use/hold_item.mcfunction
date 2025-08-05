# store slot and item in storage path
$data modify storage survey:data flagging_tape.slot set value $(slot)
$data modify storage survey:data flagging_tape.item set value '$(item)'

# 4.5-5m range raycast if player right click or item text written
execute if score @s click_writable_book matches 1.. run function survey:flagging_tape/use/raycast
execute unless score @s click_writable_book matches 1.. if function survey:flagging_tape/text_check/if_text_written run function survey:flagging_tape/use/raycast

# break flagging tape if player right click and raycast hits flagging tape
execute if score @s click_writable_book matches 1.. if data storage survey:data {flagging_tape:{raycast_result:"flagging_tape"}} if data storage survey:data {flagging_tape:{slot:"mainhand"}} at @e[tag=flagging_tape_target_pos,type=marker,distance=..10] run function survey:flagging_tape/break
execute if score @s click_writable_book matches 1.. if data storage survey:data {flagging_tape:{raycast_result:"flagging_tape"}} if data storage survey:data {flagging_tape:{slot:"offhand"}} unless items entity @s weapon.mainhand minecraft:music_disc_lava_chicken[minecraft:custom_data~{"survey_tool":1b}] at @e[tag=flagging_tape_target_pos,type=marker,distance=..10] run function survey:flagging_tape/break

# new 4.5-5m range raycast if player breaks flagging tape and valid item text written
execute if score @s click_writable_book matches 1.. if data storage survey:data {flagging_tape:{raycast_result:"flagging_tape"}} if data storage survey:data {flagging_tape:{slot:"mainhand"}} if function survey:flagging_tape/text_check/if_text_written if function survey:flagging_tape/text_check/if_valid_text run function survey:flagging_tape/use/raycast
execute if score @s click_writable_book matches 1.. if data storage survey:data {flagging_tape:{raycast_result:"flagging_tape"}} if data storage survey:data {flagging_tape:{slot:"offhand"}} unless items entity @s weapon.mainhand minecraft:music_disc_lava_chicken[minecraft:custom_data~{"survey_tool":1b}] if function survey:flagging_tape/text_check/if_text_written if function survey:flagging_tape/text_check/if_valid_text run function survey:flagging_tape/use/raycast

# place flagging tape if valid item text written and raycast hits block
execute if function survey:flagging_tape/text_check/if_text_written if function survey:flagging_tape/text_check/if_valid_text if data storage survey:data {flagging_tape:{raycast_result:"block"}} if data storage survey:data {flagging_tape:{slot:"mainhand"}} at @e[tag=flagging_tape_target_pos,type=marker,distance=..10,limit=1] run function survey:flagging_tape/use/place
execute if function survey:flagging_tape/text_check/if_text_written if function survey:flagging_tape/text_check/if_valid_text if data storage survey:data {flagging_tape:{raycast_result:"block"}} if data storage survey:data {flagging_tape:{slot:"offhand"}} unless items entity @s weapon.mainhand minecraft:music_disc_lava_chicken[minecraft:custom_data~{"survey_tool":1b}] at @e[tag=flagging_tape_target_pos,type=marker,distance=..10,limit=1] run function survey:flagging_tape/use/place
# update item if item text written
execute if function survey:flagging_tape/text_check/if_text_written run function survey:flagging_tape/item/update

# remove raycast tag and marker
tag @s remove self
kill @e[tag=flagging_tape_target_pos,type=marker,distance=..10]