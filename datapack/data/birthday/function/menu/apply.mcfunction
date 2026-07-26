# apply model number to the item's custom_model_data
data modify entity @s item.components."minecraft:custom_model_data".floats set value [0.0]
data modify entity @s item.components."minecraft:custom_model_data".floats[0] set from storage birthday:temp model
# apply uniform scale via transformation
data modify entity @s transformation.scale set value [1.0,1.0,1.0]
data modify entity @s transformation.scale[0] set from storage birthday:temp scale
data modify entity @s transformation.scale[1] set from storage birthday:temp scale
data modify entity @s transformation.scale[2] set from storage birthday:temp scale
tag @s remove bday.new
