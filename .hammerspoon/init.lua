watchers = {}
function watchers:add(watcher)
  table.insert(self, watcher)
end

require("app-hotkeys")
require("macos-focus-workaround")

watchers:add(hs.pathwatcher.new(hs.configdir, hs.reload):start())
