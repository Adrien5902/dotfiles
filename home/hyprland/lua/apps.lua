require("lua.hostname")

-------------------------
------ MY PROGRAMS ------
-------------------------

local function tui(name)
	return {
		start_cmd = "ghostty -e " .. name,
		selector = "title:" .. name,
		table_selector = {
			title = name
		}
	}
end

local spotify = {
	start_cmd = "spotify",
	selector = "class:Spotify",
	table_selector = {
		class = "Spotify"
	}
}

-- Set programs that you use
return {
	-- Apps
	terminal = "ghostty",
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
