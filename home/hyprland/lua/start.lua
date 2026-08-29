local apps = require("lua.apps")

-----------------------
------ AUTOSTART ------
-----------------------

-- Autostart necessary processes (like notifications daemons, status bars, etc.)
-- Or execute your favorite apps at launch like this:
function start()
    hl.exec_cmd("cd ~/projects/uhu-wattou && " .. apps.cargo_bin .. "/uhu-wattou")
    hl.exec_cmd("wl-paste --watch clipvault store")
    hl.exec_cmd("xrandr --output DP-2 --primary")
    hl.exec_cmd("kdeconnectd")
    -- hl.exec_cmd("steam -silent")
end

return start
