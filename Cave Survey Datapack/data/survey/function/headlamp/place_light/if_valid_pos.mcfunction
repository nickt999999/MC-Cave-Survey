# return false if block is not empty
execute unless block ~ ~ ~ #air run return 0
# return false if bordering update prevention tagged block or ice
execute if block ~-1 ~ ~ #survey:prevent_block_update run return 0
execute if block ~1 ~ ~ #survey:prevent_block_update run return 0
execute if block ~ ~-1 ~ #survey:prevent_block_update run return 0
execute if block ~ ~1 ~ #survey:prevent_block_update run return 0
execute if block ~ ~ ~-1 #survey:prevent_block_update run return 0
execute if block ~ ~ ~1 #survey:prevent_block_update run return 0
# else - return true
return 1