# get disto range from loaded position raycast
scoreboard players set #survey survey.disto.forwards_raycast_steps -1
function survey:disto/use/raycast/raycast_range_loop
scoreboard players operation #survey survey.disto.range = #survey survey.disto.forwards_raycast_steps
# calculate front raycast step limit from disto range
scoreboard players operation #survey survey.disto.forwards_raycast_step_limit = #survey survey.disto.range
scoreboard players operation #survey survey.disto.forwards_raycast_step_limit *= #survey survey.10
# return disto range
return run scoreboard players get #survey survey.disto.range