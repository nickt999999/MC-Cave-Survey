# store char indices in storage path
execute store result storage survey:data flagging_tape.text_check.newline.start_index int 1 run scoreboard players get #survey survey.flagging_tape.char_start_index
execute store result storage survey:data flagging_tape.text_check.newline.end_index int 1 run scoreboard players get #survey survey.flagging_tape.char_end_index
# end loop and return true if char matches \n
execute if function survey:flagging_tape/text_check/newline/if_char_matches_newline run return run data modify storage survey:data flagging_tape.text_check.newline.result set value 1b
# increment text indices
scoreboard players add #survey survey.flagging_tape.char_start_index 1
scoreboard players add #survey survey.flagging_tape.char_end_index 1
# end loop and return false if end of text reached
execute if score #survey survey.flagging_tape.char_start_index = #survey survey.flagging_tape.text_length run return run data modify storage survey:data flagging_tape.text_check.newline.result set value 0b
# loop function
return run function survey:flagging_tape/text_check/newline/if_text_contains_newline_loop