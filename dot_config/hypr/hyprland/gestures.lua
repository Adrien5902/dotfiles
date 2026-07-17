---------------
--- GESTURES---
---------------

local apps = require("hyprland.apps")

hl.gesture({ mods = "SUPER", fingers = 3, direction = "down", action = "close" })
hl.gesture({ mods = "SUPER", fingers = 3, direction = "up", action = "fullscreen" })

------------------------
--- MUSIC AND SOUNDS ---
------------------------

hl.gesture({
	fingers = 4,
	direction = "up",
	action = function()
		hl.exec_cmd(
			"wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+")
	end
})
hl.gesture({
	fingers = 4,
	direction = "down",
	action = function()
		hl.exec_cmd(
			"wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%-")
	end
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

hl.bind("pause", hl.dsp.exec_cmd("playerctl play-pause"))
