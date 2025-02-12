watchers = {}
function watchers:add(watcher)
  table.insert(self, watcher)
end

watchers:add(hs.pathwatcher.new(hs.configdir, hs.reload):start())

function toggleApp(id)
  local app = hs.application.get(id)
  if app == nil then
    hs.application.open(id)
    return
  end
  if app:isFrontmost() then
    app:hide()
  else
    app:activate()
  end
end

function selectMenuItem(app, menuItem)
  local result = app:selectMenuItem(menuItem)
  if result == nil then
    for _ = 1, 10 do
      hs.timer.usleep(1e5)
      local result = app:selectMenuItem(menuItem)
      if result ~= nil then
        break
      end
    end
  end
end

function registerAppHotkey(id, mods, key)
  hs.hotkey.bind(mods, key, function()
    toggleApp(id)
  end)
end

function registerMediaHotkey(mediaKey, mods, key)
  hs.hotkey.bind(mods, key, function()
    hs.eventtap.event.newSystemKeyEvent(mediaKey, true):post()
    hs.eventtap.event.newSystemKeyEvent(mediaKey, false):post()
  end)
end
