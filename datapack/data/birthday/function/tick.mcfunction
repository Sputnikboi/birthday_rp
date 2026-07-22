# Spin all tagged item displays once every 60 ticks (3s per revolution).
# teleport_duration makes the client interpolate the rotation smoothly,
# so we only need one command per cycle, not per tick.
scoreboard players add #bday.timer bday 1
execute if score #bday.timer bday matches 60.. run scoreboard players set #bday.timer bday 0
execute if score #bday.timer bday matches 0 as @e[type=item_display,tag=bday.spin] at @s run tp @s ~ ~ ~ ~6 ~
