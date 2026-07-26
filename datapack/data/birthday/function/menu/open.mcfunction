# defaults
execute unless score @s bday.model matches 1.. run scoreboard players set @s bday.model 1
execute unless score @s bday.scale matches 1.. run scoreboard players set @s bday.scale 1

tellraw @s {"text":"\n=== Decoration Placer ===","color":"light_purple","bold":true}
tellraw @s {"text":" Choose a model:","color":"yellow"}
tellraw @s [\
  {"text":" [Red]","color":"red","click_event":{"action":"run_command","command":"/trigger bday.sel set 1"}},\
  {"text":" [Blue]","color":"blue","click_event":{"action":"run_command","command":"/trigger bday.sel set 2"}},\
  {"text":" [Yellow]","color":"yellow","click_event":{"action":"run_command","command":"/trigger bday.sel set 3"}},\
  {"text":" [Pink]","color":"light_purple","click_event":{"action":"run_command","command":"/trigger bday.sel set 4"}},\
  {"text":" [Purple]","color":"dark_purple","click_event":{"action":"run_command","command":"/trigger bday.sel set 5"}},\
  {"text":" [Green]","color":"green","click_event":{"action":"run_command","command":"/trigger bday.sel set 6"}}]
tellraw @s [\
  {"text":" [Moobloom]","color":"gold","click_event":{"action":"run_command","command":"/trigger bday.sel set 10"}},\
  {"text":" [Yippee]","color":"white","click_event":{"action":"run_command","command":"/trigger bday.sel set 20"}}]
tellraw @s {"text":" Scale:","color":"yellow"}
tellraw @s [\
  {"text":" [0.5x]","color":"aqua","click_event":{"action":"run_command","command":"/trigger bday.scl set 1"}},\
  {"text":" [1x]","color":"aqua","click_event":{"action":"run_command","command":"/trigger bday.scl set 2"}},\
  {"text":" [2x]","color":"aqua","click_event":{"action":"run_command","command":"/trigger bday.scl set 3"}},\
  {"text":" [3x]","color":"aqua","click_event":{"action":"run_command","command":"/trigger bday.scl set 4"}}]
tellraw @s [{"text":" » ","color":"gray"},{"text":"[PLACE]","color":"green","bold":true,"click_event":{"action":"run_command","command":"/trigger bday.sel set 100"}},{"text":"  ","color":"gray"},{"text":"[REMOVE nearby]","color":"red","click_event":{"action":"run_command","command":"/trigger bday.sel set 101"}}]
tellraw @s {"text":"","color":"gray"}
