require("lua.hostname")

-------------------------
------ MY PROGRAMS ------
-------------------------

local terminal = "ghostty"

local function tui(name)
	return {
		start_cmd = terminal .. " -e " .. name,
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

local obsidian = {
	start_cmd = "obsidian",
	selector = "class:md.obsidian.Obsidian",
	table_selector = {
		class = "md.obsidian.Obsidian",
	},
}

-- Set programs that you use
return {
	-- Apps
	terminal = terminal,
	fileManager = "thunar",
	browser = "zen-beta",
	discord = "discord",
	spotify = spotify,
	notes = obsidian,
	editor = tui(os.getenv("EDITOR") or "nvim"),

	-- Paths
	local_bin = "$HOME/.local/bin",
	cargo_bin = "$HOME/.cargo/bin",
}
