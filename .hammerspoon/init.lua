local function toggleApp(id)
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

local function registerAppHotkey(id, mods, key)
  hs.hotkey.bind(mods, key, function()
    toggleApp(id)
  end)
end

registerAppHotkey("co.zeit.hyper", { "cmd", "ctrl" }, "t")

local lastActivatedApp = nil
local restoreActivationTimer = hs.timer.delayed.new(0.1, function()
  if lastActivatedApp ~= nil then
    lastActivatedApp:activate()
  end
end)

hs.application.watcher
  .new(function(name, event, app)
    if event == hs.application.watcher.activated then
      if name == "WindowManager" then
        restoreActivationTimer:start()
      else
        lastActivatedApp = app
      end
    end
  end)
  :start()

local lastFocusedWindowBySpace = {}

hs.window.filter.default:subscribe(hs.window.filter.windowFocused, function(window, name)
  lastFocusedWindowBySpace[hs.spaces.focusedSpace()] = window
end)

hs.spaces.watcher
  .new(function()
    lastActivatedApp = nil
    restoreActivationTimer:stop()
    if hs.application.frontmostApplication():name() == "WindowManager" then
      lastFocusedWindow = lastFocusedWindowBySpace[hs.spaces.focusedSpace()]
      if lastFocusedWindow ~= nil then
        lastFocusedWindow:focus()
      end
    end
  end)
  :start()

hs.pathwatcher.new(hs.configdir, hs.reload):start()
