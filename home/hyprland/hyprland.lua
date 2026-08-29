-- Refer to the wiki for more information.
-- https://wiki.hypr.land/Configuring/

-- Please note not all available settings / options are set here.
-- For a full list, see the wiki

-- You can split this configuration into multiple files
-- Create your files separately and then link them to this file like this:
require("lua.hostname")

require("lua.animations")
require("lua.monitors")
require("lua.variables")
require("lua.input")
require("lua.windows_and_workspaces")

-----------------------
------ AUTOSTART ------
-----------------------

local start = require("lua.start")
hl.on("hyprland.start", start)

-----------------------------------
------ ENVIRONMENT VARIABLES ------
-----------------------------------

-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Environment-variables/

hl.env("HYPRCURSOR_THEME", "MikuCat")
hl.env("HYPRCURSOR_SIZE", 24)

local binds_disabled = false
if not binds_disabled then
	require("lua.binds")
end

local function toggleBinds()
	binds_disabled = not binds_disabled
	hl.exec_cmd("notify-send \"Hyprland keybinds disabled : " .. tostring(not binds_disabled) .. "\"")
end

hl.bind("SUPER+ALT+M", toggleBinds)

-------------------------
------ PERMISSIONS ------
-------------------------

-- See https://wiki.hypr.land/Configuring/Permissions/
-- Please note permission changes here require a Hyprland restart and are not applied on-the-fly
-- for security reasons

-- ecosystem {
--   enforce_permissions = 1
-- }

-- permission = /usr/(bin|local/bin)/grim, screencopy, allow
-- permission = /usr/(lib|libexec|lib64)/xdg-desktop-portal-lua. screencopy, allow
-- permission = /usr/(bin|local/bin)/hyprpm, plugin, allow


---------------
--- GESTURES---
---------------

if is_laptop then
	require("lua.gestures")
end
