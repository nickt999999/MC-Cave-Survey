# give flagging tape item
give @s writable_book[item_name="Flagging Tape",item_model="survey:flagging_tape",custom_data={flagging_tape:1b,survey_tool:1b,survey_datapack:1b},max_damage=45]

# re-enable command objective
execute if entity @s[tag=survey.op] run scoreboard players enable @s survey.give_flagging_tape
execute if entity @s[tag=survey.op] run scoreboard players set @s survey.give_flagging_tape 0