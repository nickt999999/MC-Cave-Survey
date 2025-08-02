# give witeout item
give @s carrot_on_a_stick[item_name="Wite-Out",item_model="survey:witeout",custom_data={witeout:1b,survey_tool:1b,survey_datapack:1b},max_damage=70]

# re-enable command objective
execute if entity @s[tag=survey.op] run scoreboard players enable @s survey.give_witeout
execute if entity @s[tag=survey.op] run scoreboard players set @s survey.give_witeout 0