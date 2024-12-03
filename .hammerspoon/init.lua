require("prelude")

watchers:add(hs.pathwatcher.new(hs.configdir, hs.reload):start())

registerMediaHotkey("PLAY", { "cmd", "ctrl" }, "/")
registerMediaHotkey("PREVIOUS", { "cmd", "ctrl" }, ",")
registerMediaHotkey("NEXT", { "cmd", "ctrl" }, ".")

require("focus-workaround")
