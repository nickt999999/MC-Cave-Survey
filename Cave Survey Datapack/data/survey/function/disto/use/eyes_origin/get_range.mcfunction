# get disto range from loaded position raycast
scoreboard players set #survey disto_forwards_raycast_steps -1
function survey:disto/use/raycast/raycast_range_loop
scoreboard players operation #survey disto_range = #survey disto_forwards_raycast_steps
# calculate front raycast step limit from disto range
scoreboard players operation #survey disto_forwards_raycast_step_limit = #survey disto_range
scoreboard players operation #survey disto_forwards_raycast_step_limit *= #survey 10
# return disto range
return run scoreboard players get #survey disto_range