# replace item with empty text and damage from storage path
$item replace entity @s weapon.$(slot) with stone[custom_data={"replace_flagging_tape":1b}]
$item replace entity @s weapon.$(slot) with writable_book[item_name="Flagging Tape",item_model="survey:flagging_tape",custom_data={flagging_tape:1b,survey_tool:1b,survey_datapack:1b},max_damage=45,damage=$(damage)]