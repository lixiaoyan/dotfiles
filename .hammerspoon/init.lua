require("prelude")

registerMediaHotkey("PLAY", { "cmd", "ctrl" }, "/")
registerMediaHotkey("PREVIOUS", { "cmd", "ctrl" }, ",")
registerMediaHotkey("NEXT", { "cmd", "ctrl" }, ".")

hs.hotkey.bind({ "alt" }, "space", function()
  local id = "com.mitchellh.ghostty"
  local menuItem = { "View", "Quick Terminal" }
  local app = hs.application.get(id)
  if app == nil then
    hs.execute("open -a Ghostty --background --args --initial-window=false", true)
    app = hs.application.get(id)
  end
  local result = app:selectMenuItem(menuItem)
  if result == nil then
    hs.timer.usleep(1e5)
    app:selectMenuItem(menuItem)
  end
end)

require("focus-workaround")
