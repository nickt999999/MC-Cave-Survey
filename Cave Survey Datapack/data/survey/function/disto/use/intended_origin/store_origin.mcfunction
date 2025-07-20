# set eyes shot origin if player is horizontal
execute positioned ~ ~0.61 ~ unless entity @s[dy=0] at @s anchored eyes positioned ^ ^ ^ unless entity @e[tag=witeout_blot,distance=..1.5,type=block_display] run return run data modify storage survey:data disto.shot.origin set value "eyes"
# else - set witeout blot shot origin if witeout blot nearby
execute positioned ~ ~0.61 ~ if entity @s[dy=0] positioned ~ ~0.29 ~ if entity @e[tag=witeout_blot,distance=..1.5,type=block_display] run return run data modify storage survey:data disto.shot.origin set value "witeout"
execute positioned ~ ~0.61 ~ unless entity @s[dy=0] at @s anchored eyes positioned ^ ^ ^ if entity @e[tag=witeout_blot,distance=..1.5,type=block_display] run return run data modify storage survey:data disto.shot.origin set value "witeout"
# else - set hitbox center shot origin
data modify storage survey:data disto.shot.origin set value "center"