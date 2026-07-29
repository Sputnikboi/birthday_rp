# Re-scale decorations already placed nearby, so a size can be dialled in
# without deleting and re-placing.
execute store result storage birthday:temp scale float 0.01 run scoreboard players get @s bday.scale
function birthday:menu/view_range
execute as @e[type=item_display,tag=bday.spin,distance=..16] run function birthday:menu/resize
tellraw @s [{"text":"Rescaled nearby decorations to ","color":"gold"},{"score":{"name":"@s","objective":"bday.scale"},"color":"white"},{"text":"%","color":"gray"}]
