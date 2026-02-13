# remove witeout blot
kill @e[tag=survey.witeout.entity,sort=nearest,limit=1,type=block_display,distance=..0.1]
# remove witeout blot position marker
kill @e[tag=survey.witeout.blot_target_pos,sort=nearest,limit=1,type=marker,distance=..0.1]