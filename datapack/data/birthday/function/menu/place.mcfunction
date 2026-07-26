# summon display 2 blocks in front, slightly up
execute anchored eyes positioned ^ ^1 ^2 run summon item_display ~ ~ ~ {Tags:["bday.spin","bday.new"],teleport_duration:4,item:{id:"minecraft:carrot_on_a_stick",count:1}}

# set model from bday.model (as float in custom_model_data)
execute store result storage birthday:temp model float 1 run scoreboard players get @s bday.model

# compute scale factor = bday.scale/100
execute store result storage birthday:temp scale float 0.01 run scoreboard players get @s bday.scale

# apply model + scale + item_display transform to nearest new display
execute as @e[type=item_display,tag=bday.new,limit=1,sort=nearest] run function birthday:menu/apply
