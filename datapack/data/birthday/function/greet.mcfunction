tag @s add bday.greeted
title @s times 10 70 20
title @s title {"text":"Happy Birthday!","color":"light_purple","bold":true}
title @s subtitle {"text":"Have a wonderful day!","color":"yellow"}
playsound minecraft:ui.toast.challenge_complete master @s ~ ~ ~ 1 1
particle minecraft:heart ~ ~1.5 ~ 0.5 0.5 0.5 0 20
summon firework_rocket ~ ~ ~ {LifeTime:30,FireworksItem:{id:"minecraft:firework_rocket",count:1,components:{"minecraft:fireworks":{explosions:[{shape:"large_ball",has_twinkle:true,has_trail:true,colors:[16744448,16777045,5636095],fade_colors:[16733525]}],flight_duration:2}}}}
