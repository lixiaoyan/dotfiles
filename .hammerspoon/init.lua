require("prelude")

watchers:add(hs.pathwatcher.new(hs.configdir, hs.reload):start())

registerAppHotkey("co.zeit.hyper", { "cmd", "ctrl" }, "t")

registerMediaHotkey("PLAY", { "cmd", "ctrl" }, "/")
registerMediaHotkey("PREVIOUS", { "cmd", "ctrl" }, ",")
registerMediaHotkey("NEXT", { "cmd", "ctrl" }, ".")

require("focus-workaround")
