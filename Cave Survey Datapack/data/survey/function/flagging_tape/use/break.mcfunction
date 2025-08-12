# remove flagging tape
kill @e[tag=flagging_tape,sort=nearest,limit=1,distance=..0.15,type=text_display]
# remove flagging tape position marker
kill @e[tag=flagging_tape_placed_target_pos,sort=nearest,limit=1,distance=..0.15,type=marker]