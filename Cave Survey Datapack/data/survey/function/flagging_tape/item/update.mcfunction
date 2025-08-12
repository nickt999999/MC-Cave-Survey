# replace item if below item max damage
execute unless score #survey survey.flagging_tape.damage matches 45 run function survey:flagging_tape/item/replace with storage survey:data flagging_tape
# break item if reaches item max damage
execute if score #survey survey.flagging_tape.damage matches 45 at @s run function survey:flagging_tape/item/break with storage survey:data flagging_tape