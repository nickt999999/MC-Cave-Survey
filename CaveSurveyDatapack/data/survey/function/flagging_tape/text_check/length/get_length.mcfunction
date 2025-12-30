# loop through text until text index equals text length
scoreboard players set #survey survey.flagging_tape.char_start_index 0
function survey:flagging_tape/text_check/length/get_length_loop
# return text length unless text length exceeds 12
execute if score #survey survey.flagging_tape.char_start_index matches 0..12 run return run scoreboard players get #survey survey.flagging_tape.char_start_index
# else - return -1
return -1