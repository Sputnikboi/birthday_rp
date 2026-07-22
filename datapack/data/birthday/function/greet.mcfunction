title @s times 10 60 20
title @s title {"text":"Happy Birthday!","color":"light_purple","bold":true}
title @s subtitle {"text":"This world was made just for you \u2764","color":"yellow"}
playsound minecraft:ui.toast.challenge_complete master @s ~ ~ ~ 1 1
playsound minecraft:entity.player.levelup master @s ~ ~ ~ 1 1.2
particle minecraft:heart ~ ~2.2 ~ 0.5 0.5 0.5 0 20
particle minecraft:firework ~ ~1.5 ~ 1.5 1.5 1.5 0.05 150
summon firework_rocket ~ ~2 ~ {LifeTime:30,FireworksItem:{id:"minecraft:firework_rocket",count:1,components:{"minecraft:fireworks":{explosions:[{shape:"large_ball",has_twinkle:true,has_trail:true,colors:[I;16711850,16777011],fade_colors:[I;16711850]},{shape:"star",has_twinkle:true,colors:[I;65535,16711850]}],flight_duration:2}}}}
tellraw @s [{"text":"\u2764 ","color":"red"},{"text":"Use ","color":"gray"},{"text":"/function birthday:give/all","color":"gold"},{"text":" to get the decorations!","color":"gray"}]
