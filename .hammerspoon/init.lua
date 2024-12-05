require("prelude")

registerMediaHotkey("PLAY", { "cmd", "ctrl" }, "/")
registerMediaHotkey("PREVIOUS", { "cmd", "ctrl" }, ",")
registerMediaHotkey("NEXT", { "cmd", "ctrl" }, ".")

require("focus-workaround")
