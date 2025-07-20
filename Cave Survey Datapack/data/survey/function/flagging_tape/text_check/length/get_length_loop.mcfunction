# store text index in storage path
execute store result storage survey:data flagging_tape.text_check.length.index int 1 run scoreboard players get #survey flagging_tape_char_start_index
# end loop if text index equals text length
execute if function survey:flagging_tape/text_check/length/if_index_equals_length run return 0
# increment text index
scoreboard players add #survey flagging_tape_char_start_index 1
# end loop if 13 repeats
execute if score #survey flagging_tape_char_start_index matches 13 run return 0
# loop function
function survey:flagging_tape/text_check/length/get_length_loop