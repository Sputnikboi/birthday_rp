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

# --- birthday welcome, on every login ---
# A player whose leave_game count has moved since we last looked has just
# rejoined, so clear their greeted tag and let the welcome fire again.
execute as @a unless score @s bday.seen = @s bday.left run tag @s remove bday.greeted
execute as @a run scoreboard players operation @s bday.seen = @s bday.left
# emdi is the birthday person. Sputnikboi is here too so it can be tested -
# delete that second line to stop greeting yourself.
execute as @a[name=emdi,tag=!bday.greeted] at @s run function birthday:greet
execute as @a[name=Sputnikboi,tag=!bday.greeted] at @s run function birthday:greet

# --- wand right-click detection: open menu ---
execute as @a[scores={bday.used=1..},predicate=birthday:holding_wand] run function birthday:menu/open
scoreboard players set @a[scores={bday.used=1..}] bday.used 0
