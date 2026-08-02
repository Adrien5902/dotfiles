---------------
--- GESTURES---
---------------

local apps = require("hyprland.apps")

hl.gesture({ mods = "SUPER", fingers = 3, direction = "down", action = "close" })
hl.gesture({ mods = "SUPER", fingers = 3, direction = "up", action = "fullscreen" })

hl.gesture({
	fingers = 3,
	direction = "horizontal",
	action = "workspace"
})


------------------------
--- MUSIC AND SOUNDS ---
------------------------
-- Adjust volume
local volume_gesture = function(change) hl.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ " ..
	math.abs(change) .. "%" .. (change < 0 and "-" or "+")) end
hl.gesture({
	fingers = 4,
	direction = "vertical",
	action = {
		start = function(e) volume_gesture(-0.25 * e.delta.y) end,
		update = function(e) volume_gesture(-0.25 * e.delta.y) end
	},
})

hl.gesture({
	fingers = 4,
	mods = "SUPER",
	direction = "up",
	action = function()
		hl.exec_cmd(apps.local_bin ..
			"/appvolume +")
	end
})
hl.gesture({
	fingers = 4,
	mods = "SUPER",
	direction = "down",
	action = function()
		hl.exec_cmd(apps.local_bin ..
			"/appvolume -")
	end
})

-- Requires playerctl
hl.gesture({ fingers = 4, direction = "left", action = function() hl.exec_cmd("playerctl previous") end })
hl.gesture({ fingers = 4, direction = "right", action = function() hl.exec_cmd("playerctl next") end })

