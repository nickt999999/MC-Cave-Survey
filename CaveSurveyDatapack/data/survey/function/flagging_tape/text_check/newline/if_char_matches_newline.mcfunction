# store char in storage path
function survey:flagging_tape/text_check/newline/store_char with storage survey:data flagging_tape.text_check.newline
# return true if char matches \n
execute store success storage survey:data flagging_tape.text_check.overwrite_success byte 1 run data modify storage survey:data flagging_tape.text_check.newline.char set value "\n"
execute if data storage survey:data {flagging_tape:{text_check:{overwrite_success:0b}}} run return 1
# else - return false
return 0