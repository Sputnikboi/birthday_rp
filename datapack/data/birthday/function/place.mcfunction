# Spawns a spinning item_display of the item in your main hand, 1.5 blocks in front.
summon item_display ^ ^1.5 ^1.5 {Tags:["bday.spin"],teleport_duration:60,item:{id:"minecraft:stone",count:1}}
data modify entity @e[type=item_display,tag=bday.spin,limit=1,sort=nearest] item set from entity @s SelectedItem
tellraw @s {"text":"Placed a spinning decoration!","color":"green"}
