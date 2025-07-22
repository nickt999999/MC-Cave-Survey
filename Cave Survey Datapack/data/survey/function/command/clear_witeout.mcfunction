# get number of witeout blots
scoreboard players set #survey witeout_blot_count 0
execute at @e[tag=witeout_blot,type=block_display] run scoreboard players add #survey witeout_blot_count 1

# display error if 0 witeout blots
execute if score #survey witeout_blot_count matches 0 run tellraw @s [{"text":"["},{"text":"SURVEY","color":"red"},{"text":"] "},{"text":"No witeout blots were found","color":"red"}]
# display confirm text
execute unless score @s clear_witeout_timer matches 1..100 if score #survey witeout_blot_count matches 1 run tellraw @s [{"text":"["},{"text":"SURVEY","color":"red"},{"text":"] Clear "},{"score":{"name":"#survey","objective":"witeout_blot_count"}},{"text":" Wite-Out blot? Re-enter command to confirm"}]
execute unless score @s clear_witeout_timer matches 1..100 if score #survey witeout_blot_count matches 2.. run tellraw @s [{"text":"["},{"text":"SURVEY","color":"red"},{"text":"] Clear "},{"score":{"name":"#survey","objective":"witeout_blot_count"}},{"text":" Wite-Out blots? Re-enter command to confirm"}]
# display clear text
execute if score @s clear_witeout_timer matches 1..100 if score #survey witeout_blot_count matches 1 run tellraw @s [{"text":"["},{"text":"SURVEY","color":"red"},{"text":"] Cleared "},{"score":{"name":"#survey","objective":"witeout_blot_count"}},{"text":" Wite-Out blot"}]
execute if score @s clear_witeout_timer matches 1..100 if score #survey witeout_blot_count matches 2.. run tellraw @s [{"text":"["},{"text":"SURVEY","color":"red"},{"text":"] Cleared "},{"score":{"name":"#survey","objective":"witeout_blot_count"}},{"text":" Wite-Out blots"}]

# remove witeout blots 
execute if score #survey witeout_blot_count matches 1.. if score @s clear_witeout_timer matches 1..100 at @e[tag=witeout_blot,type=block_display] run function survey:witeout/break

# update confirm timer
execute if score #survey witeout_blot_count matches 1.. unless score @s clear_witeout_timer matches 1..100 run scoreboard players set @s clear_witeout_timer 100
execute if score #survey witeout_blot_count matches 1.. if score @s clear_witeout_timer matches 1..99 run scoreboard players set @s clear_witeout_timer 0