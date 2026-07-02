local apps = require("hyprland.apps")
local start = require("hyprland.start")

-------------------------
------ KEYBINDINGS ------
-------------------------

local main_mod = "SUPER + "

-- Example binds, see https://wiki.hypr.land/Configuring/Binds/ for more
-- Apps
hl.bind(main_mod .. "Q", hl.dsp.exec_cmd(apps.terminal))
hl.bind(main_mod .. "A", hl.dsp.exec_cmd(apps.browser))
hl.bind(main_mod .. "S", hl.dsp.exec_cmd(apps.spotify))
hl.bind(main_mod .. "S", hl.dsp.focus({ window = "class:Spotify" }))
hl.bind(main_mod .. "D", hl.dsp.exec_cmd(apps.discord))
hl.bind(main_mod .. "D", hl.dsp.focus({ window = "class:discord" }))
hl.bind(main_mod .. "SHIFT+A", hl.dsp.exec_cmd("steam"))
hl.bind(main_mod .. "SHIFT+A", hl.dsp.focus({ window = "class:steam" }))
hl.bind(main_mod .. "E", hl.dsp.exec_cmd(apps.fileManager))
hl.bind(main_mod .. "V", hl.dsp.exec_cmd(apps.code_editor))
hl.bind(main_mod .. "O", hl.dsp.exec_cmd(apps.notes))

-- Screen copy
hl.bind(main_mod .. "M", hl.dsp.exec_cmd("hyprpicker | wl-copy"))
hl.bind(main_mod .. "SHIFT + S", hl.dsp.exec_cmd("grim -g \"$(slurp)\" - | wl-copy"))
hl.bind("Print", hl.dsp.exec_cmd("grim -o \"DP-2\" - | wl-copy"))
hl.bind("SHIFT+Print", hl.dsp.exec_cmd("grim -o \"HDMI-A-2\" - | wl-copy"))
hl.bind(main_mod .. "SHIFT + O", hl.dsp.exec_cmd("grim -g \"$(slurp)\" - | tesseract - - | wl-copy"))

-- HL Stuff
hl.bind(main_mod .. "F", hl.dsp.window.float())
hl.bind(main_mod .. "TAB", hl.dsp.window.fullscreen())
hl.bind(main_mod .. "mouse:274", hl.dsp.window.close())
hl.bind(main_mod .. "C", hl.dsp.window.close())
hl.bind(main_mod .. "ALT+C", hl.dsp.window.kill())
hl.bind(main_mod .. "SHIFT+R", start)
hl.bind(main_mod .. "SHIFT+T", hl.dsp.exec_cmd(apps.local_bin .. "/toggle-mute-notif"))
hl.bind(main_mod .. "SHIFT+CTRL+TAB", hl.dsp.exit())

-- Phone mirror
hl.bind(main_mod .. "P", hl.dsp.exec_cmd(apps.local_bin .. "/phone-camera 1"))
hl.bind(main_mod .. "ALT+P", hl.dsp.exec_cmd(apps.local_bin .. "/phone-camera 2"))

--ROFI
hl.bind(main_mod .. "R", hl.dsp.exec_cmd("rofi -show run"))
hl.bind(main_mod .. "SPACE",
	hl.dsp.exec_cmd(
		"rofi -modi games -combi-modi \"drun,games\" -show-icons -combi-display-format \"{text}\" -show combi"))
hl.bind(main_mod .. "SEMICOLON", hl.dsp.exec_cmd(apps.local_bin .. "/clipmenu"))
hl.bind(main_mod .. "SHIFT + C", hl.dsp.exec_cmd("rofi -show calc -modi calc -no-sort"))
hl.bind(main_mod .. "SHIFT + E", hl.dsp.exec_cmd("rofi -modi emoji -show emoji"))
hl.bind(main_mod .. "SHIFT + P",
	hl.dsp.exec_cmd("rofi -show power-menu -modi power-menu:" .. apps.local_bin .. "/rofi-power-menu"))
hl.bind(main_mod .. "SHIFT + D", hl.dsp.exec_cmd(apps.local_bin .. "/dmenudunsthistory"))

-------------------------
--- WINDOW MANAGEMENT ---
-------------------------

local directions = {
	left  = "l",
	right = "r",
	up    = "u",
	down  = "d",

	h     = "l",
	j     = "d",
	k     = "u",
	l     = "r",
}

-- Focus windows
for key, dir in pairs(directions) do
	hl.bind(
		main_mod .. key,
		hl.dsp.focus({ direction = dir })
	)
end

-- Move windows
for key, dir in pairs(directions) do
	hl.bind(
		main_mod .. "SHIFT + " .. key,
		hl.dsp.window.move({ direction = dir })
	)
end

-- Resize windows
for key, dir in pairs(directions) do
	local x = 0
	local y = 0
	local amount = 100

	if dir == "l" then
		x = x - amount
	elseif dir == "d" then
		y = y + amount
	elseif dir == "u" then
		y = y - amount
	elseif dir == "r" then
		x = x + amount
	end

	hl.bind(
		main_mod .. "ALT + " .. key,
		hl.dsp.window.resize({ x = x, y = y, relative = true })
	)
end

local azerty_keys = {
	"ampersand", -- 1
	"eacute", -- 2
	"quotedbl", -- 3
	"apostrophe", -- 4
	"parenleft", -- 5
	"minus", -- 6
	"egrave", -- 7
	"underscore", -- 8
	"ccedilla", -- 9
	"agrave", -- 0
}

-- Azerty keys
for i, key in ipairs(azerty_keys) do
	-- Move
	hl.bind(
		main_mod .. key,
		hl.dsp.focus({ workspace = i })
	)

	-- Focus
	hl.bind(
		main_mod .. "SHIFT + " .. key,
		hl.dsp.window.move({
			workspace = i,
			follow = false,
		})
	)
end

-- Numpad keys
for i = 1, 10 do
	local i_mod_10 = i % 10

	-- Focus
	hl.bind(
		main_mod .. "KP_" .. i_mod_10,
		hl.dsp.focus({ workspace = i })
	)

	-- Move
	hl.bind(
		main_mod .. "SHIFT + KP_" .. i_mod_10,
		hl.dsp.window.move({
			workspace = i,
			follow = false,
		})
	)
end

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(main_mod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(main_mod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(main_mod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(main_mod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Laptop multimedia keys for volume and LCD brightness
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
	{ locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
	{ locked = true, repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
	{ locked = true, repeating = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
	{ locked = true, repeating = true })

hl.bind("SUPER + XF86AudioRaiseVolume", hl.dsp.exec_cmd(apps.local_bin .. "/appvolume +"), { locked = true })
hl.bind("SUPER + XF86AudioLowerVolume", hl.dsp.exec_cmd(apps.local_bin .. "/appvolume -"), { locked = true })

-- Requires playerctl
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

-- bind = , XF86Tools, exec, xdotool key ctrl+super+meta+m
-- bind = , XF86Launch5, exec, xdotool key xdotool key ctrl+super+meta+c

-- bind = , XF86Launch6, exec,
-- bind = , XF86Launch7, exec,
-- bind = , XF86Launch8, exec,

-- windowrule{
--     name = Genshin
--     match:title = Genshin Impact

--     bind = , mouse:275, exec, xdotool key a
--     bind = , mouse:276, exec, xdotool key e
--     bind = , mouse:277, exec, xdotool key f
--     bind = , mouse:278, exec, xdotool key n
--     bind = , mouse:279, exec, xdotool key t
-- }
