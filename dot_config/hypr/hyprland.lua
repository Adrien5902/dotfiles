-- This is an example Hyprland config file.
-- Refer to the wiki for more information.
-- https://wiki.hypr.land/Configuring/

-- Please note not all available settings / options are set here.
-- For a full list, see the wiki

-- You can split this configuration into multiple files
-- Create your files separately and then link them to this file like this:
-- source = ~/.config/hypr/myColors.conf


----------------------
------ MONITORS ------
----------------------

-- See https://wiki.hypr.land/Configuring/Basics/Monitors/
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

-------------------------
------ MY PROGRAMS ------
-------------------------

-- See https://wiki.hypr.land/Configuring/Keywords/

-- Set programs that you use
local terminal = "kitty"
local fileManager = "thunar"
local browser = "flatpak run app.zen_browser.zen"
local discord = "discord"
local spotify = "spotify-launcher"
local obsidian = "flatpak run md.obsidian.Obsidian"

local localbin = "$HOME/.local/bin"
local cargobin = "$HOME/.cargo/bin"


-----------------------
------ AUTOSTART ------
-----------------------

-- Autostart necessary processes (like notifications daemons, status bars, etc.)
-- Or execute your favorite apps at launch like this:
hl.on("hyprland.start", function()
    hl.dsp.exec_cmd("sudo keyd")
    hl.dsp.exec_cmd("sleep 1; " .. localbin .. "/rlwpp")
    hl.dsp.exec_cmd("cd ~/uhu-wattou && " .. cargobin .. "/uhu-wattou")
    hl.dsp.exec_cmd("python ~/waybar-ycal/popup.py & disown")
    hl.dsp.exec_cmd("wl-paste --watch clipvault store")
    hl.dsp.exec_cmd("xrandr --output DP-2 --primary")
end)

----------------------------------------------------------
------ ENVIRONMENT VARIABLES ------
----------------------------------------------------------

-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Environment-variables/

hl.env("XCURSOR_SIZE", 24)
hl.env("HYPRCURSOR_SIZE", 24)


--------------------------------------
------ PERMISSIONS ------
--------------------------------------

-- See https://wiki.hypr.land/Configuring/Permissions/
-- Please note permission changes here require a Hyprland restart and are not applied on-the-fly
-- for security reasons

-- ecosystem {
--   enforce_permissions = 1
-- }

-- permission = /usr/(bin|local/bin)/grim, screencopy, allow
-- permission = /usr/(lib|libexec|lib64)/xdg-desktop-portal-hyprland, screencopy, allow
-- permission = /usr/(bin|local/bin)/hyprpm, plugin, allow

-----------------------
---- LOOK AND FEEL ----
-----------------------

-- Refer to https://wiki.hypr.land/Configuring/Basics/Variables/
hl.config({
    general = {
        gaps_in          = 5,
        gaps_out         = 20,

        border_size      = 2,

        col              = {
            active_border   = { colors = { "rgba(67C9FFee)", "rgba(EFB4FFee)" }, angle = 45 },
            inactive_border = "rgba(595959ee)",
        },

        -- Set to true to enable resizing windows by clicking and dragging on borders and gaps
        resize_on_border = false,

        -- Please see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Tearing/ before you turn this on
        allow_tearing    = false,

        layout           = "dwindle",
    },

    decoration = {
        rounding         = 10,
        rounding_power   = 2,

        -- Change transparency of focused and unfocused windows
        active_opacity   = 1.0,
        inactive_opacity = 1.0,

        shadow           = {
            enabled      = true,
            range        = 4,
            render_power = 3,
            color        = 0xee1a1a1a,
        },

        blur             = {
            enabled  = true,
            size     = 3,
            passes   = 1,
            vibrancy = 0.1696,
        },
    },

    animations = {
        enabled = true,
    },
})

-- Default curves and animations, see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Animations/
hl.curve("easeOutQuint", { type = "bezier", points = { { 0.23, 1 }, { 0.32, 1 } } })
hl.curve("easeInOutCubic", { type = "bezier", points = { { 0.65, 0.05 }, { 0.36, 1 } } })
hl.curve("linear", { type = "bezier", points = { { 0, 0 }, { 1, 1 } } })
hl.curve("almostLinear", { type = "bezier", points = { { 0.5, 0.5 }, { 0.75, 1 } } })
hl.curve("quick", { type = "bezier", points = { { 0.15, 0 }, { 0.1, 1 } } })

-- Default springs
hl.curve("easy", { type = "spring", mass = 1, stiffness = 71.2633, dampening = 15.8273644 })

hl.animation({ leaf = "global", enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "border", enabled = true, speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows", enabled = true, speed = 4.79, spring = "easy" })
hl.animation({ leaf = "windowsIn", enabled = true, speed = 4.1, spring = "easy", style = "popin 87%" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 1.49, bezier = "linear", style = "popin 87%" })
hl.animation({ leaf = "fadeIn", enabled = true, speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut", enabled = true, speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade", enabled = true, speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "layers", enabled = true, speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn", enabled = true, speed = 4, bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut", enabled = true, speed = 1.5, bezier = "linear", style = "fade" })
hl.animation({ leaf = "fadeLayersIn", enabled = true, speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesIn", enabled = true, speed = 1.21, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesOut", enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "zoomFactor", enabled = true, speed = 7, bezier = "quick" })

-- Ref https://wiki.hypr.land/Configuring/Workspace-Rules/
-- "Smart gaps" / "No gaps when only"
-- uncomment all if you wish to use that.

-- Odd = primary, Even = secondary
hl.workspace_rule({ workspace = 1, monitor = "DP-2", default = true })
hl.workspace_rule({ workspace = 3, monitor = "DP-2" })
hl.workspace_rule({ workspace = 5, monitor = "DP-2" })
hl.workspace_rule({ workspace = 7, monitor = "DP-2" })
hl.workspace_rule({ workspace = 9, monitor = "DP-2" })
hl.workspace_rule({ workspace = 2, monitor = "HDMI-A-2", default = true })
hl.workspace_rule({ workspace = 4, monitor = "HDMI-A-2" })
hl.workspace_rule({ workspace = 6, monitor = "HDMI-A-2" })
hl.workspace_rule({ workspace = 8, monitor = "HDMI-A-2" })
hl.workspace_rule({ workspace = 10, monitor = "HDMI-A-2" })

-- workspace = w[tv1], gapsout:0, gapsin:0
-- workspace = f[1], gapsout:0, gapsin:0
-- windowrule {
--     name = no-gaps-wtv1
--     match:float = false
--     match:workspace = w[tv1]
--
--     border_size = 0
--     rounding = 0
-- }
--
-- windowrule {
--     name = no-gaps-f1
--     match:float = false
--     match:workspace = f[1]
--
--     border_size = 0
--     rounding = 0
-- }

-- See https://wiki.hypr.land/Configuring/Layouts/Dwindle-Layout/ for more
hl.config({
    dwindle = {
        preserve_split = true, -- You probably want this
    },
})

-- See https://wiki.hypr.land/Configuring/Layouts/Master-Layout/ for more
hl.config({
    master = {
        new_status = "master",
    },
})

-- See https://wiki.hypr.land/Configuring/Layouts/Scrolling-Layout/ for more
hl.config({
    scrolling = {
        fullscreen_on_one_column = true,
    },
})

---------------
---- INPUT ----
---------------

hl.config({
    input = {
        kb_layout    = "fr,us",
        kb_variant   = "",
        kb_model     = "",
        kb_options   = "",
        kb_rules     = "",

        follow_mouse = 1,

        sensitivity  = 0, -- -1.0 - 1.0, 0 means no modification.

        touchpad     = {
            natural_scroll = false,
        },
    },
})

hl.gesture({
    fingers = 3,
    direction = "horizontal",
    action = "workspace"
})

-- Example per-device config
-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Devices/ for more
hl.device({
    name        = "epic-mouse-v1",
    sensitivity = -0.5,
})

-------------------------
------ KEYBINDINGS ------
-------------------------

local mainMod = "SUPER + "

-- Example binds, see https://wiki.hypr.land/Configuring/Binds/ for more

hl.bind(mainMod .. "Q", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. "A", hl.dsp.exec_cmd(browser))
hl.bind(mainMod .. "SHIFT + S", hl.dsp.exec_cmd("grim -g \"$(slurp)\" - | wl-copy"))
hl.bind("Print", hl.dsp.exec_cmd("grim -o \"DP-2\" - | wl-copy"))
hl.bind(mainMod .. "SHIFT + O", hl.dsp.exec_cmd("grim -g \"$(slurp)\" - | tesseract - - | wl-copy"))
hl.bind(mainMod .. "M", hl.dsp.exec_cmd("hyprpicker | wl-copy"))
hl.bind(mainMod .. "S", hl.dsp.exec_cmd(spotify))
hl.bind(mainMod .. "S", hl.dsp.focus({ window = "class:Spotify" }))
hl.bind(mainMod .. "D", hl.dsp.exec_cmd(discord))
hl.bind(mainMod .. "D", hl.dsp.focus({ window = "class:discord" }))
hl.bind(mainMod .. "E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. "V", hl.dsp.exec_cmd("code"))
hl.bind(mainMod .. "O", hl.dsp.exec_cmd(obsidian))
hl.bind(mainMod .. "F", hl.dsp.window.float())
hl.bind(mainMod .. "TAB", hl.dsp.window.fullscreen())
hl.bind(mainMod .. "mouse:274", hl.dsp.window.close())
hl.bind(mainMod .. "C", hl.dsp.window.close())

--ROFI
hl.bind(mainMod .. "R", hl.dsp.exec_cmd("rofi -show run"))
hl.bind(mainMod .. "SPACE",
    hl.dsp.exec_cmd(
        "rofi -modi games -combi-modi \"drun,games\" -show-icons -combi-display-format \"{text}\" -show combi"))
hl.bind(mainMod .. "SEMICOLON", hl.dsp.exec_cmd(localbin .. "/clipmenu"))
hl.bind(mainMod .. "SHIFT + C", hl.dsp.exec_cmd("rofi -show calc -modi calc -no-sort"))
hl.bind(mainMod .. "SHIFT + E", hl.dsp.exec_cmd("rofi -modi emoji -show emoji"))
hl.bind(mainMod .. "SHIFT + P",
    hl.dsp.exec_cmd("rofi -show power-menu -modi power-menu:" .. localbin .. "/rofi-power-menu"))
hl.bind(mainMod .. "SHIFT + D", hl.dsp.exec_cmd(localbin .. "/dmenudunsthistory"))

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
        mainMod .. key,
        hl.dsp.focus({ direction = dir })
    )
end

-- Move windows
for key, dir in pairs(directions) do
    hl.bind(
        mainMod .. "SHIFT + " .. key,
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
        mainMod .. "ALT + " .. key,
        hl.dsp.window.resize({ x = x, y = y, relative = true })
    )
end


local azerty_keys = {
    "ampersand",  -- 1
    "eacute",     -- 2
    "quotedbl",   -- 3
    "apostrophe", -- 4
    "parenleft",  -- 5
    "minus",      -- 6
    "egrave",     -- 7
    "underscore", -- 8
    "ccedilla",   -- 9
    "agrave",     -- 10
}

-- Focus workspace
for i, key in ipairs(azerty_keys) do
    hl.bind(
        mainMod .. key,
        hl.dsp.focus({ workspace = i })
    )
end

-- Focus workspace with numpad
for i = 1, 9 do
    hl.bind(
        mainMod .. "KP_" .. i,
        hl.dsp.focus({ workspace = i })
    )
end

hl.bind(
    mainMod .. "KP_0",
    hl.dsp.focus({ workspace = 10 })
)

-- Move window to workspace
for i, key in ipairs(azerty_keys) do
    hl.bind(
        mainMod .. "SHIFT + " .. key,
        hl.dsp.window.move({
            workspace = i,
            follow = false,
        })
    )
end

-- Move window with numpad
for i = 1, 9 do
    hl.bind(
        mainMod .. "SHIFT + KP_" .. i,
        hl.dsp.window.move({
            workspace = i,
            follow = false,
        })
    )
end

hl.bind(
    mainMod .. "SHIFT + KP_0",
    hl.dsp.window.move({
        workspace = 10,
        follow = false,
    })
)

-- Example special workspace (scratchpad)
-- bind = SUPER, S, togglespecialworkspace, magic
-- bind = SUPER SHIFT, S, movetoworkspace, special:magic

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Laptop multimedia keys for volume and LCD brightness
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
    { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
    { locked = true, repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
    { locked = true, repeating = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
    { locked = true, repeating = true })

hl.bind("SUPER + XF86AudioRaiseVolume", hl.dsp.exec_cmd(localbin .. "/appvolume +"), { locked = true })
hl.bind("SUPER + XF86AudioLowerVolume", hl.dsp.exec_cmd(localbin .. "/appvolume -"), { locked = true })

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


--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/
-- and https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/

hl.window_rule({
    -- Fix some dragging issues with XWayland
    name     = "fix-xwayland-drags",
    match    = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },

    no_focus = true,
})

-- Hyprland-run windowrule
hl.window_rule({
    name  = "move-hyprland-run",
    match = { class = "hyprland-run" },

    move  = "20 monitor_h-120",
    float = true,
})

hl.layer_rule({
    match        = { namespace = "rofi" },
    blur         = true,
    ignore_alpha = 0.5,
})

hl.layer_rule({
    match     = { namespace = "notifications" },
    animation = "popin"
})
