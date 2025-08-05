# give headlamp item
give @s minecraft:music_disc_lava_chicken[!minecraft:jukebox_playable,minecraft:equippable={slot:head,damage_on_hurt:0b},minecraft:item_name="Zebralight H600Fd Mk IV 18650 XHP50.2 Floody 5000K High CRI Headlamp",minecraft:item_model="survey:headlamp",minecraft:custom_data={headlamp:1b,survey_datapack:1b}]

# re-enable command objective
execute if entity @s[tag=survey.op] run scoreboard players enable @s survey.give_headlamp
execute if entity @s[tag=survey.op] run scoreboard players set @s survey.give_headlamp 0