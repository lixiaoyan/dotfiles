watchers = {}
function watchers:add(watcher)
  table.insert(self, watcher)
end

watchers:add(hs.pathwatcher.new(hs.configdir, hs.reload):start())

require("app-hotkeys")
require("focus-workaround")
