# store flagging tape text in storage path
data modify storage survey:data flagging_tape.text_check.length.substring set from storage survey:data flagging_tape.item_text
# return true if text matches flagging tape text
$execute store success storage survey:data flagging_tape.text_check.overwrite_success byte 1 run data modify storage survey:data flagging_tape.text_check.length.substring set string storage survey:data flagging_tape.item_text 0 $(index)
execute if data storage survey:data {flagging_tape:{text_check:{overwrite_success:0b}}} run return 1
# else - return false
return 0