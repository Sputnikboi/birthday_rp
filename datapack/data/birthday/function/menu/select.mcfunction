# store selection
execute if score @s bday.sel matches 1..99 run scoreboard players operation @s bday.model = @s bday.sel
# PLACE
execute if score @s bday.sel matches 100 at @s run function birthday:menu/place
# REMOVE
execute if score @s bday.sel matches 101 at @s run function birthday:menu/remove_near
# feedback for model selections (not place/remove)
execute if score @s bday.sel matches 1..6 run tellraw @s {"text":"Balloon selected. Click [PLACE] to spawn (right-click wand to reopen).","color":"green"}
execute if score @s bday.sel matches 10 run tellraw @s {"text":"Moobloom selected. Click [PLACE] to spawn.","color":"green"}
execute if score @s bday.sel matches 20 run tellraw @s {"text":"Yippee selected. Click [PLACE] to spawn.","color":"green"}
# reset trigger
scoreboard players set @s bday.sel 0
