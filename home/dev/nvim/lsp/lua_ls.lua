return {
	cmd = { 'lua-language-server' },
	filetypes = { 'lua' },
	root_markers = { { '.luarc.json', '.luarc.jsonc' }, '.git' },

	diagostics = {
		globals = { "vim" }
	},

	settings = {
		Lua = {
			runtime = {
				version = 'LuaJIT',
			}
		}
	}
}
