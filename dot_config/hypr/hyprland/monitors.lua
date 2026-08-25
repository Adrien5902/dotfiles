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

local low_res = false
local function update_low_res(is_low_res)
	if is_low_res then
		hl.monitor({
			output = "eDP-1",
			mode = "1280x720@50.18700",
			scale = 1,
		})
	else
		hl.monitor({
			output = "eDP-1",
			mode = "1920x1080@50.18700",
			scale = 1,
		})
	end
end

local function toggle_vertical_or_low_res()
	if is_desktop then
		vertical = not vertical
		update_vertical_monitor(vertical)
		hl.exec_cmd(apps.local_bin .. "/rlwpp")
	end

	if is_laptop then
		low_res = not low_res
		update_low_res(low_res)
	end
end


hl.bind("SUPER + I", toggle_vertical_or_low_res)

if is_laptop then
	update_low_res(low_res)
elseif is_desktop then
	hl.monitor({
		output = "DP-2",
		mode = "1920x1080@165",
		position = "0x0",
		scale = 1
	})

	update_vertical_monitor(vertical)
end
