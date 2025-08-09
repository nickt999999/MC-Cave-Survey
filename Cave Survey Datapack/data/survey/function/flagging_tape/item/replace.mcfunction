# replace item with empty text and damage from storage path
# TEMP test if stone thing needed?
$item replace entity @s weapon.$(slot) with stone[minecraft:custom_data={"replace_flagging_tape":1b}]
$item replace entity @s weapon.$(slot) with writable_book[minecraft:max_damage=45,minecraft:damage=$(damage),minecraft:item_name="Flagging Tape",minecraft:item_model="survey:flagging_tape",minecraft:custom_data={flagging_tape:1b,survey_datapack:1b}]