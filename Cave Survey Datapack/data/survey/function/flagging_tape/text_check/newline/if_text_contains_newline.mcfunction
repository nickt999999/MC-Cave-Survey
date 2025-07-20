# loop through text until char matches \n or end of text reached
scoreboard players set #survey flagging_tape_char_start_index 0
scoreboard players set #survey flagging_tape_char_end_index 1
function survey:flagging_tape/text_check/newline/if_text_contains_newline_loop
# return true if text contains newline
execute if data storage survey:data {flagging_tape:{text_check:{newline:{result:1b}}}} run return 1
# else - return false
return 0