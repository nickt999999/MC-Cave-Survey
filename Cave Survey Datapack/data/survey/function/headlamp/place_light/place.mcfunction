# spawn light position marker
$summon marker ~ ~ ~ {Tags:["light_pos","$(light_type)","survey_datapack"]}

# calculate iterations for each axis
$scoreboard players set #survey place_light_counter_x $(light_size)
scoreboard players operation #survey place_light_counter_x += #survey place_light_counter_x
scoreboard players add #survey place_light_counter_x 1
scoreboard players operation #survey place_light_counter_y = #survey place_light_counter_x
scoreboard players operation #survey place_light_counter_z = #survey place_light_counter_x
# place xyz cube of blocks
$execute positioned ~-$(light_size) ~ ~ run function survey:headlamp/place_light/place_xyz_loop {light_size:$(light_size)}