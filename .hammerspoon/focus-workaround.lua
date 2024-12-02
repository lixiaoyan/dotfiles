-- https://www.reddit.com/r/MacOS/comments/1fmmqj7/severe_focus_loss_bug_still_not_fixed_in_macos/

local lastActivatedApp = nil
local lastActivatedTime = 0
local restoreActivationTimer = nil
local lastFocusedWindowBySpace = {}

watchers:add(hs.application.watcher
  .new(function(name, event, app)
    if event == hs.application.watcher.activated then
      if app:bundleID() == "com.apple.WindowManager" then
        if hs.timer.absoluteTime() - lastActivatedTime < 1e9 then
          -- Fast path
          if lastActivatedApp ~= nil then
            lastActivatedApp:activate()
          end
        else
          restoreActivationTimer = hs.timer.doAfter(0.1, function()
            if lastActivatedApp ~= nil then
              lastActivatedApp:activate()
            end
          end)
        end
      else
        lastActivatedApp = app
        lastActivatedTime = hs.timer.absoluteTime()
      end
    end
  end)
  :start())

hs.window.filter.default:subscribe(hs.window.filter.windowFocused, function(window)
  for _, space in ipairs(hs.spaces.windowSpaces(window)) do
    lastFocusedWindowBySpace[space] = window
  end
end)

watchers:add(hs.spaces.watcher
  .new(function()
    lastActivatedApp = nil
    if restoreActivationTimer ~= nil then
      restoreActivationTimer:stop()
      restoreActivationTimer = nil
    end

    if hs.application.frontmostApplication():bundleID() == "com.apple.WindowManager" then
      lastFocusedWindow = lastFocusedWindowBySpace[hs.spaces.focusedSpace()]
      if lastFocusedWindow ~= nil then
        lastFocusedWindow:focus()
      end
    end
  end)
  :start())
