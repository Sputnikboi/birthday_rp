execute if score @s bday.scl matches 1 run scoreboard players set @s bday.scale 50
execute if score @s bday.scl matches 2 run scoreboard players set @s bday.scale 100
execute if score @s bday.scl matches 3 run scoreboard players set @s bday.scale 200
execute if score @s bday.scl matches 4 run scoreboard players set @s bday.scale 300
tellraw @s [{"text":"Scale set to "},{"score":{"name":"@s","objective":"bday.scale"}},{"text":"%. Click [PLACE] to spawn."}]
scoreboard players set @s bday.scl 0
