# The trigger value IS the scale percentage: 100 = 1x, 1000 = 10x, 10000 = 100x.
# So any scale can be typed directly with:  /trigger bday.scl set <percent>
scoreboard players operation @s bday.scale = @s bday.scl

# Clamp to 0.1x .. 100x.
execute if score @s bday.scale matches ..9 run scoreboard players set @s bday.scale 10
execute if score @s bday.scale matches 10001.. run scoreboard players set @s bday.scale 10000

tellraw @s [{"text":"Scale: ","color":"aqua"},{"score":{"name":"@s","objective":"bday.scale"},"color":"white"},{"text":"%","color":"gray"},{"text":"   (1x = 100%)","color":"dark_gray"}]
tellraw @s [{"text":" » ","color":"gray"},{"text":"[PLACE]","color":"green","bold":true,"click_event":{"action":"run_command","command":"/trigger bday.sel set 100"}},{"text":"  "},{"text":"[RESCALE nearby]","color":"gold","click_event":{"action":"run_command","command":"/trigger bday.sel set 102"}}]
scoreboard players set @s bday.scl 0
