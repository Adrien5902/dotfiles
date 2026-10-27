local capabilities = require("cmp_nvim_lsp").default_capabilities()

vim.lsp.config("*", {
	capabilities = capabilities,
})

vim.lsp.enable({
	"jedi_language_server",
	"nil_ls",
	"crates",
	"jsonls",
	"just",
	"lua_ls",
	"ocamllsp",
	"rust_analyser",
	"biome",
	"vtsls",
})
