# 4.5/5m range raycast
execute if entity @s[gamemode=creative] run scoreboard players set #survey survey.flagging_tape.raycast_steps 0
execute if entity @s[gamemode=!creative] run scoreboard players set #survey survey.flagging_tape.raycast_steps 50
function survey:flagging_tape/raycast/raycast_use_chiseled_bookshelf_loop