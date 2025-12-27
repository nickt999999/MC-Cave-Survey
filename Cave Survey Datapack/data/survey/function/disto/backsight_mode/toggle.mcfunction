# temp
say toggle

# reset timers
scoreboard players set @s survey.disto.swaphands_timer 0
scoreboard players set @s survey.disto.change_backsight_mode_timer 10

# replace item with updated backsight mode
$item replace entity @s weapon.$(slot) with music_disc_lava_chicken[!minecraft:jukebox_playable,minecraft:consumable={consume_seconds:2147483647},minecraft:item_name="Disto-X2",minecraft:item_model="survey:disto",minecraft:custom_data={disto:1b,disto_id:$(disto_id),backsight_mode:$(new_mode)b,survey_datapack:1b}]

# display chat output
execute if data storage survey:data {disto:{backsight_mode:{new_mode:0b}}} run tellraw @s [{"text":"["},{"text":"DISTO","color":"red"},{"text":"] "},{"text":"(*) ","color":"gold"},{"text":"Backsight mode disabled"}]
execute if data storage survey:data {disto:{backsight_mode:{new_mode:1b}}} run tellraw @s [{"text":"["},{"text":"DISTO","color":"red"},{"text":"] "},{"text":"(*) ","color":"gold"},{"text":"Backsight mode enabled"}]
# play toggle sound
execute if data storage survey:data {disto:{backsight_mode:{new_mode:0b}}} run playsound block.bamboo_wood_button.click_off master @a ~ ~ ~ 1 2
execute if data storage survey:data {disto:{backsight_mode:{new_mode:1b}}} run playsound block.bamboo_wood_button.click_on master @a ~ ~ ~ 1 2