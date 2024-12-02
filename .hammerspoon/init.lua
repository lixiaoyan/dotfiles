require("prelude")

watchers:add(hs.pathwatcher.new(hs.configdir, hs.reload):start())

registerAppHotkey("co.zeit.hyper", { "cmd", "ctrl" }, "t")

registerMediaHotkey("PREVIOUS", { "cmd", "ctrl" }, "left")
registerMediaHotkey("NEXT", { "cmd", "ctrl" }, "right")

require("focus-workaround")
