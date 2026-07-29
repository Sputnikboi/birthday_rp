# A display entity stops rendering past view_range * ~64 blocks. At the default
# of 1.0 a 100x decoration vanishes long before you have backed up far enough to
# see it, so scale the range with the model. Clamped to 1x..16x so we don't ask
# the client to render everything from across the world.
scoreboard players operation #bday.vr bday.scale = @s bday.scale
execute if score #bday.vr bday.scale matches ..99 run scoreboard players set #bday.vr bday.scale 100
execute if score #bday.vr bday.scale matches 1601.. run scoreboard players set #bday.vr bday.scale 1600
execute store result storage birthday:temp view_range float 0.01 run scoreboard players get #bday.vr bday.scale
