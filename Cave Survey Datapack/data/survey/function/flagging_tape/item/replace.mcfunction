# replace item with empty text and update damage
$item replace entity @s weapon.$(slot) with minecraft:air
$item replace entity @s weapon.$(slot) with minecraft:writable_book[minecraft:max_damage=45,minecraft:damage=$(damage),minecraft:item_name="Flagging Tape",minecraft:item_model="survey:flagging_tape",minecraft:custom_data={flagging_tape:1b,survey_datapack:1b}]