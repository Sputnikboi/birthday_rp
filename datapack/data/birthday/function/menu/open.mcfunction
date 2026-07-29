# defaults
execute unless score @s bday.model matches 1.. run scoreboard players set @s bday.model 1
# scale is a PERCENTAGE, so the sensible default is 100 (= 1x), not 1 (= 0.01x)
execute unless score @s bday.scale matches 1.. run scoreboard players set @s bday.scale 100

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
  {"text":" [Yippee]","color":"white","click_event":{"action":"run_command","command":"/trigger bday.sel set 20"}},\
  {"text":" [Party Hat]","color":"aqua","click_event":{"action":"run_command","command":"/trigger bday.sel set 30"}}]
tellraw @s [{"text":" Scale: ","color":"yellow"},{"score":{"name":"@s","objective":"bday.scale"},"color":"white"},{"text":"%","color":"gray"}]
tellraw @s [\
  {"text":" [0.5x]","color":"aqua","click_event":{"action":"run_command","command":"/trigger bday.scl set 50"}},\
  {"text":" [1x]","color":"aqua","click_event":{"action":"run_command","command":"/trigger bday.scl set 100"}},\
  {"text":" [2x]","color":"aqua","click_event":{"action":"run_command","command":"/trigger bday.scl set 200"}},\
  {"text":" [5x]","color":"aqua","click_event":{"action":"run_command","command":"/trigger bday.scl set 500"}},\
  {"text":" [10x]","color":"aqua","click_event":{"action":"run_command","command":"/trigger bday.scl set 1000"}}]
tellraw @s [\
  {"text":" [25x]","color":"dark_aqua","click_event":{"action":"run_command","command":"/trigger bday.scl set 2500"}},\
  {"text":" [50x]","color":"dark_aqua","click_event":{"action":"run_command","command":"/trigger bday.scl set 5000"}},\
  {"text":" [100x]","color":"dark_aqua","click_event":{"action":"run_command","command":"/trigger bday.scl set 10000"}},\
  {"text":"  [Custom...]","color":"light_purple","underlined":true,"click_event":{"action":"suggest_command","command":"/trigger bday.scl set 1500"},"hover_event":{"action":"show_text","value":"Type any percentage: 100 = 1x, 10000 = 100x"}}]
tellraw @s [{"text":" » ","color":"gray"},{"text":"[PLACE]","color":"green","bold":true,"click_event":{"action":"run_command","command":"/trigger bday.sel set 100"}},{"text":"  "},{"text":"[RESCALE nearby]","color":"gold","click_event":{"action":"run_command","command":"/trigger bday.sel set 102"}},{"text":"  "},{"text":"[REMOVE nearby]","color":"red","click_event":{"action":"run_command","command":"/trigger bday.sel set 101"}}]
tellraw @s {"text":"","color":"gray"}
