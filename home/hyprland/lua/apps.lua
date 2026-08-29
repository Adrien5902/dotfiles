require("lua.hostname")

-------------------------
------ MY PROGRAMS ------
-------------------------

local function tui(name)
	return {
		start_cmd = "kitty  -e " .. name,
		selector = "title:" .. name,
		table_selector = {
			title = name
		}
	}
end

local low_performance = is_laptop

local spotify
if low_performance then
	spotify = tui("ncspot")
else
	spotify = {
		start_cmd = "spotify",
		selector = "class:Spotify",
		table_selector = {
			class = "Spotify"
		}
	}
end

-- Set programs that you use
return {
	-- Apps
	terminal = "kitty",
	fileManager = "thunar",
	browser = "zen-beta",
	discord = "discord",
	spotify = spotify,
	notes = "obsidian",
	editor = tui(os.getenv("EDITOR") or "nvim"),

	-- Paths
	local_bin = "$HOME/.local/bin",
	cargo_bin = "$HOME/.cargo/bin",
}
