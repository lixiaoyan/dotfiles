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
