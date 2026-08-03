require("hyprland.hostname")
local apps = require("hyprland.apps")

----------------------
------ MONITORS ------
----------------------

-- See https://wiki.hypr.land/Configuring/Basics/Monitors/
local vertical = true

local function update_vertical_monitor(is_vertical)
	if is_vertical then
		hl.monitor({
			output = "HDMI-A-2",
			mode = "1920x1080@144",
			position = "-1080x-800",
			scale = 1,
			transform = 3,
		})
	else
		hl.monitor({
			output = "HDMI-A-2",
			mode = "1920x1080@144",
			position = "-1920x-800",
			scale = 1,
			transform = 0,
		})
	end
end

local function toggle_vertical()
	vertical = not vertical
	update_vertical_monitor(vertical)
	hl.exec_cmd(apps.local_bin .. "/rlwpp")
end


hl.bind("SUPER + I", toggle_vertical)

if is_laptop then
	hl.monitor({
		output = "eDP-1",
		mode = "1920x1080@50.18700",
		scale = 1,
	})
elseif is_desktop then
	hl.monitor({
		output = "DP-2",
		mode = "1920x1080@165",
		position = "0x0",
		scale = 1
	})

	update_vertical_monitor(vertical)
end
