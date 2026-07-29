scoreboard objectives add bday.timer dummy
scoreboard objectives add bday.used minecraft.used:minecraft.carrot_on_a_stick
scoreboard objectives add bday.model dummy
scoreboard objectives add bday.scale dummy
scoreboard objectives add bday.sel trigger
scoreboard objectives add bday.scl trigger
# Vanilla has no join event. leave_game auto-increments on disconnect, so
# comparing it against the last value we saw detects a fresh login.
scoreboard objectives add bday.left minecraft.custom:minecraft.leave_game
scoreboard objectives add bday.seen dummy
tellraw @a[tag=bday_debug] {"text":"[birthday] loaded","color":"gold"}
