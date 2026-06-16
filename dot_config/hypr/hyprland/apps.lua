-------------------------
------ MY PROGRAMS ------
-------------------------

-- See https://wiki.hypr.land/Configuring/Keywords/

-- Set programs that you use
return {
    -- Apps
    ["terminal"] = "kitty",
    ["fileManager"] = "thunar",
    ["browser"] = "flatpak run app.zen_browser.zen",
    ["discord"] = "discord",
    ["spotify"] = "spotify-launcher",
    ["notes"] = "flatpak run md.obsidian.Obsidian",
    ["code_editor"] = "code",

    -- Paths
    ["local_bin"] = "$HOME/.local/bin",
    ["cargobin"] = "$HOME/.cargo/bin",
}
