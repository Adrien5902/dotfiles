local apps = require("hyprland.apps")

--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/
-- and https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/

local workspaces = {
    ["main"] = 1,
    ["secondary"] = 2,
    ["browser"] = 3,
    ["reading"] = 4,
    ["games"] = 5
}

function table_invert(t)
    local s = {}
    for k, v in pairs(t) do
        s[v] = k
    end
    return s
end

local inverted_workspaces = table_invert(workspaces)

-- Ref https://wiki.hypr.land/Configuring/Workspace-Rules/

if is_laptop then
    hl.workspace_rule({ workspace = "1", monitor = "eDP-1", default = true })
elseif is_desktop then
    local main_monitor = "DP-2"
    local secondary_monitor = "HDMI-A-2"

    -- Odd = primary monitor, Even = secondary monitor
    for i = 1, 10, 1 do
        local name = inverted_workspaces[i]

        local monitor
        if i % 2 == 1 then
            monitor = main_monitor
        else
            monitor = secondary_monitor
        end

        local on_created_empty
        if name == "browser" then
            on_created_empty = apps.browser
        end

        local default = (i - 1 / 2) == 0
        hl.workspace_rule({
            workspace = tostring(i),
            monitor = monitor,
            default = default,
            default_name = name,
            on_created_empty = on_created_empty
        })
    end
end

hl.window_rule({
    match = {
        class = "Spotify"
    },
    workspace = workspaces["secondary"]
})
hl.window_rule({
    match = {
        class = "discord"
    },
    workspace = workspaces["secondary"]
})

hl.window_rule({
    match = {
        class = apps["browser"]
    },
    workspace = workspaces["browser"]
})

---------------
---- GAMES ----
---------------

hl.window_rule({
    match = {
        content = "game"
    },
    workspace = workspaces["games"] .. " silent"
})

hl.window_rule({
    match = { class = "(steam_app_\\d+)|(org.vinegarhq.Sober)|(\\w+.exe)" },
    content = "game"
})

---------------

hl.window_rule({
    -- Fix some dragging issues with XWayland
    name  = "fix-xwayland-drags",
    match = {
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

hl.window_rule({
    name = "float-pip",
    match = { initial_title = "Picture-in-Picture" },
    float = true
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

hl.layer_rule({
    match = { namespace = "waybar" },
    order = -1,
})

hl.window_rule({
	match = { fullscreen = true },
	idle_inhibit = "focus"
})
