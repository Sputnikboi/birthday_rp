# Runs as an existing item_display. Applies the scale/view_range currently in
# storage without disturbing the model it is showing.
data modify entity @s transformation.scale set value [1.0,1.0,1.0]
data modify entity @s transformation.scale[0] set from storage birthday:temp scale
data modify entity @s transformation.scale[1] set from storage birthday:temp scale
data modify entity @s transformation.scale[2] set from storage birthday:temp scale
data modify entity @s view_range set from storage birthday:temp view_range
