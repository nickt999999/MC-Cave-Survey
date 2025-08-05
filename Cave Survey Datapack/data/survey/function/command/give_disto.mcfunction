# give disto item
give @s minecraft:music_disc_lava_chicken[!minecraft:jukebox_playable,minecraft:consumable={consume_seconds:2147483647},minecraft:item_name="Disto-X2",minecraft:item_model="survey:disto",minecraft:custom_data={disto:1b,disto_id:0b,backsight_mode:0b,survey_tool:1b,survey_datapack:1b}]

# re-enable command objective
execute if entity @s[tag=survey.op] run scoreboard players enable @s survey.give_disto
execute if entity @s[tag=survey.op] run scoreboard players set @s survey.give_disto 0