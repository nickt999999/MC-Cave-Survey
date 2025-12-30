# store raycast tags in storage path
$data modify storage survey:data disto.shot.raycast.test_result set value $(result)
execute unless data storage survey:data {disto:{shot:{raycast:{test_result:0}}}} run data modify storage survey:data disto.shot.raycast.result set from storage survey:data disto.shot.raycast.test_result
# spawn raycast marker if valid result
execute unless data storage survey:data {disto:{shot:{raycast:{result:"step_limit"}}}} unless data storage survey:data {disto:{shot:{raycast:{result:"shot_intersect"}}}} run function survey:disto/use/raycast/spawn_target_marker