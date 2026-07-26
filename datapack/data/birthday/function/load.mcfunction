scoreboard objectives add bday.timer dummy
scoreboard objectives add bday.used minecraft.used:minecraft.carrot_on_a_stick
scoreboard objectives add bday.model dummy
scoreboard objectives add bday.scale dummy
scoreboard objectives add bday.sel trigger
scoreboard objectives add bday.scl trigger
tellraw @a[tag=bday_debug] {"text":"[birthday] loaded","color":"gold"}
