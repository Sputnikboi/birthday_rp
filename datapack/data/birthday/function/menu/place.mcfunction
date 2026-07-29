# Summon the display in front of the player. The bigger the model, the further
# out it needs to go, or a 100x decoration spawns inside your own head. The three
# ranges are mutually exclusive, so exactly one summon runs.
execute if score @s bday.scale matches ..499 anchored eyes positioned ^ ^1 ^2 run summon item_display ~ ~ ~ {Tags:["bday.spin","bday.new"],teleport_duration:4,item:{id:"minecraft:carrot_on_a_stick",count:1}}
execute if score @s bday.scale matches 500..1999 anchored eyes positioned ^ ^2 ^7 run summon item_display ~ ~ ~ {Tags:["bday.spin","bday.new"],teleport_duration:4,item:{id:"minecraft:carrot_on_a_stick",count:1}}
execute if score @s bday.scale matches 2000.. anchored eyes positioned ^ ^5 ^20 run summon item_display ~ ~ ~ {Tags:["bday.spin","bday.new"],teleport_duration:4,item:{id:"minecraft:carrot_on_a_stick",count:1}}

# set model from bday.model (as float in custom_model_data)
execute store result storage birthday:temp model float 1 run scoreboard players get @s bday.model

# compute scale factor = bday.scale/100
execute store result storage birthday:temp scale float 0.01 run scoreboard players get @s bday.scale

# and a view_range that suits that size
function birthday:menu/view_range

# apply model + scale + item_display transform to nearest new display
execute as @e[type=item_display,tag=bday.new,limit=1,sort=nearest] run function birthday:menu/apply
