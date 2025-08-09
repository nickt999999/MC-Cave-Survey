# give witeout item
give @s minecraft:music_disc_lava_chicken[!minecraft:jukebox_playable,minecraft:consumable={consume_seconds:2147483647},minecraft:max_damage=70,minecraft:item_name="Wite-Out",minecraft:item_model="survey:witeout",minecraft:custom_data={witeout:1b,survey_datapack:1b}]

# re-enable command objective
execute if entity @s[tag=survey.op] run scoreboard players enable @s survey.give_witeout
execute if entity @s[tag=survey.op] run scoreboard players set @s survey.give_witeout 0