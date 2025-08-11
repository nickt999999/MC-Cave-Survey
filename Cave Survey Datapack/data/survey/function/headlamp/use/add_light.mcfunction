# place flood light at position from 5m range raycast
tag @s add self
scoreboard players set #survey headlamp_raycast_steps 0
execute anchored eyes positioned ^ ^ ^ run function survey:headlamp/raycast/raycast_flood_loop
execute at @e[tag=headlamp_target_pos,type=marker,sort=nearest,limit=1,distance=..100] run function survey:headlamp/place_light/place {light_type:"flood",light_size:1}

# place spot light at position from 75m range raycast
scoreboard players set #survey headlamp_raycast_steps 0
execute anchored eyes positioned ^ ^ ^ run function survey:headlamp/raycast/raycast_spot_loop
execute at @e[tag=headlamp_target_pos,type=marker,sort=nearest,limit=1,distance=..100] run function survey:headlamp/place_light/place {light_type:"spot",light_size:2}

# remove raycast tag and marker
tag @s remove self
kill @e[tag=headlamp_target_pos,type=marker,distance=..100]