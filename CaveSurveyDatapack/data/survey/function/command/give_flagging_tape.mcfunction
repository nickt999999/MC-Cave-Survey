# give flagging tape item
give @s minecraft:writable_book[minecraft:max_damage=45,minecraft:item_name="Flagging Tape",minecraft:item_model="survey:flagging_tape",minecraft:custom_data={flagging_tape:1b,survey:1b}]

# re-enable command objective
execute if entity @s[tag=survey.op] run scoreboard players enable @s survey.give_flagging_tape
execute if entity @s[tag=survey.op] run scoreboard players set @s survey.give_flagging_tape 0