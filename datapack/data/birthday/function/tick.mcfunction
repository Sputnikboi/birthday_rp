# --- spin: 1 revolution per second (rotate 24deg every 4 ticks = 6deg/tick) ---
scoreboard players add #bday.timer bday.timer 1
execute if score #bday.timer bday.timer matches 4.. run scoreboard players set #bday.timer bday.timer 0
execute if score #bday.timer bday.timer matches 0 as @e[type=item_display,tag=bday.spin] at @s run tp @s ~ ~ ~ ~24 ~

# --- keep triggers enabled for everyone ---
scoreboard players enable @a bday.sel
scoreboard players enable @a bday.scl

# --- handle menu selections ---
execute as @a[scores={bday.sel=1..}] run function birthday:menu/select
execute as @a[scores={bday.scl=1..}] run function birthday:menu/scale

# --- wand right-click detection: open menu ---
execute as @a[scores={bday.used=1..},predicate=birthday:holding_wand] run function birthday:menu/open
scoreboard players set @a[scores={bday.used=1..}] bday.used 0
