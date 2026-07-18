require("hyprland.hostname")

-------------------------
------ MY PROGRAMS ------
-------------------------
local low_performance = is_laptop

local spotify
if low_performance then
	spotify = {
		start_cmd = "kitty -e ncspot",
		selector = "title:ncspot"
	}
else
	spotify = {
		start_cmd = "spotify-launcher",
		selector = "class:Spotify"
	}
end

-- Set programs that you use
return {
	-- Apps
	terminal = "kitty",
	fileManager = "thunar",
	browser = "zen-browser",
	discord = "discord",
	spotify = spotify,
	notes = "obsidian",
	code_editor = "code",
	editor = os.getenv("EDITOR") or "nvim",

	-- Paths
	local_bin = "$HOME/.local/bin",
	cargo_bin = "$HOME/.cargo/bin",
}
