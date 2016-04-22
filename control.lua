require "defines"
local daylength_minutes = 30

function log(str)
  game.write_file("log.txt", str .. "\n", true)
end
function update_time()
  local daylength = 60 * 60 * daylength_minutes
  game.daytime = (game.tick % daylength) / (daylength - 1)
end
script.on_init(function()
  game.freeze_daytime(true)
  update_time()
  log("on_init")
end)
script.on_event(defines.events.on_tick, update_time)
