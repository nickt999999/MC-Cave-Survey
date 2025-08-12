# remove flagging tape
kill @e[tag=flagging_tape,sort=nearest,limit=1,type=text_display,distance=..0.1]
# remove flagging tape target position marker
kill @e[tag=flagging_tape_placed_target_pos,sort=nearest,limit=1,type=marker,distance=..0.1]