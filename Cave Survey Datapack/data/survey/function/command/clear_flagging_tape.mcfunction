# get number of flagging tape pieces
scoreboard players set #survey flagging_tape_count 0
execute at @e[tag=flagging_tape,type=text_display] run scoreboard players add #survey flagging_tape_count 1

# display error if 0 flagging tape pieces
execute if score #survey flagging_tape_count matches 0 run tellraw @s [{"text":"["},{"text":"SURVEY","color":"red"},{"text":"] "},{"text":"No flagging tape pieces were found","color":"red"}]
# display confirm text
execute unless score #survey clear_flagging_tape_timer matches 1..100 if score #survey flagging_tape_count matches 1 run tellraw @s [{"text":"["},{"text":"SURVEY","color":"red"},{"text":"] Clear "},{"score":{"name":"#survey","objective":"flagging_tape_count"}},{"text":" flagging tape piece? Re-enter command to confirm"}]
execute unless score #survey clear_flagging_tape_timer matches 1..100 if score #survey flagging_tape_count matches 2.. run tellraw @s [{"text":"["},{"text":"SURVEY","color":"red"},{"text":"] Clear "},{"score":{"name":"#survey","objective":"flagging_tape_count"}},{"text":" flagging tape pieces? Re-enter command to confirm"}]
# display clear text
execute if score #survey clear_flagging_tape_timer matches 1..100 if score #survey flagging_tape_count matches 1 run tellraw @s [{"text":"["},{"text":"SURVEY","color":"red"},{"text":"] Cleared "},{"score":{"name":"#survey","objective":"flagging_tape_count"}},{"text":" flagging tape piece"}]
execute if score #survey clear_flagging_tape_timer matches 1..100 if score #survey flagging_tape_count matches 2.. run tellraw @s [{"text":"["},{"text":"SURVEY","color":"red"},{"text":"] Cleared "},{"score":{"name":"#survey","objective":"flagging_tape_count"}},{"text":" flagging tape pieces"}]

# remove flagging tape pieces
execute if score #survey flagging_tape_count matches 1.. if score #survey clear_flagging_tape_timer matches 1..100 at @e[tag=flagging_tape,type=text_display] run function survey:flagging_tape/break

# update confirm timer
execute if score #survey flagging_tape_count matches 1.. unless score #survey clear_flagging_tape_timer matches 1..100 run scoreboard players set #survey clear_flagging_tape_timer 100
execute if score #survey flagging_tape_count matches 1.. if score #survey clear_flagging_tape_timer matches 1..99 run scoreboard players set #survey clear_flagging_tape_timer 0