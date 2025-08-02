# give disto item
give @s carrot_on_a_stick[item_name="Disto-X2",item_model="survey:disto",custom_data={disto:1b,disto_id:0b,backsight_mode:0b,survey_tool:1b,survey_datapack:1b}]

# re-enable command objective
execute if entity @s[tag=survey.op] run scoreboard players enable @s survey.give_disto
execute if entity @s[tag=survey.op] run scoreboard players set @s survey.give_disto 0