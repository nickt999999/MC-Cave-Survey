# remove light
function survey:headlamp/remove_light
# add light if headlamp held or equipped
execute if items entity @s weapon.* carrot_on_a_stick[custom_data~{headlamp:1b}] anchored eyes positioned ^ ^ ^ run function survey:headlamp/use/add_light
execute unless items entity @s weapon.* carrot_on_a_stick[custom_data~{headlamp:1b}] if items entity @s armor.head carrot_on_a_stick[custom_data~{headlamp:1b}] anchored eyes positioned ^ ^ ^ run function survey:headlamp/use/add_light