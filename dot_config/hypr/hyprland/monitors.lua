require("hyprland.hostname")

----------------------
------ MONITORS ------
----------------------

-- See https://wiki.hypr.land/Configuring/Basics/Monitors/

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
	hl.monitor({
		output = "HDMI-A-2",
		mode = "1920x1080@144",
		position = "-1080x-800",
		scale = 1,
		transform = 3,
	})
end
