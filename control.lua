local function initPlayer(e)
	local player = game.players[e.player_index]
	player.insert{name="reverse-factory-1", count = 1}
end

local function player_created(e)
  initPlayer(e)
end

local function cutscene_cancelled(e)
  if remote.interfaces["freeplay"] then
    initPlayer(e)
  end
end

script.on_event(defines.events.on_player_created, player_created)
script.on_event(defines.events.on_cutscene_cancelled, cutscene_cancelled)