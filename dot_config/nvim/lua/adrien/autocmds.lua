vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
	callback = function(event)
		local map = function(keys, func, desc)
			vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
		end

		-- defaults:
		-- https://neovim.io/doc/user/news-0.11.html#_defaults

		map("gl", vim.diagnostic.open_float, "Open Diagnostic Float")
		map("K", vim.lsp.buf.hover, "Hover Documentation")
		map("gs", vim.lsp.buf.signature_help, "Signature Documentation")
		map("<leader>gd", vim.lsp.buf.declaration, "Goto Declaration")
		map("<leader>la", vim.lsp.buf.code_action, "Code Action")
		map("<leader>lr", vim.lsp.buf.rename, "Rename all references")
		map("<leader>lf", vim.lsp.buf.format, "Format")
		map("<leader>v", "<cmd>vsplit | lua vim.lsp.buf.definition()<cr>", "Goto Definition in Vertical Split")

		local function client_supports_method(client, method, bufnr)
			if vim.fn.has 'nvim-0.11' == 1 then
				return client:supports_method(method, bufnr)
			else
				return client.supports_method(method, { bufnr = bufnr })
			end
		end

		local client = vim.lsp.get_client_by_id(event.data.client_id)
		if client and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_documentHighlight, event.buf) then
			local highlight_augroup = vim.api.nvim_create_augroup('lsp-highlight', { clear = false })

			-- When cursor stops moving: Highlights all instances of the symbol under the cursor
			-- When cursor moves: Clears the highlighting
			vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
				buffer = event.buf,
				group = highlight_augroup,
				callback = vim.lsp.buf.document_highlight,
			})
			vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
				buffer = event.buf,
				group = highlight_augroup,
				callback = vim.lsp.buf.clear_references,
			})

			-- When LSP detaches: Clears the highlighting
			vim.api.nvim_create_autocmd('LspDetach', {
				group = vim.api.nvim_create_augroup('lsp-detach', { clear = true }),
				callback = function(event2)
					vim.lsp.buf.clear_references()
					vim.api.nvim_clear_autocmds { group = 'lsp-highlight', buffer = event2.buf }
				end,
			})
		end
	end,

})


-- left columns with line count
local separator = " ▎ "

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.statuscolumn =
    '%s%=%#LineNr4#%{(v:relnum >= 4)?v:relnum."' .. separator .. '":""}' ..
    '%#LineNr3#%{(v:relnum == 3)?v:relnum."' .. separator .. '":""}' ..
    '%#LineNr2#%{(v:relnum == 2)?v:relnum."' .. separator .. '":""}' ..
    '%#LineNr1#%{(v:relnum == 1)?v:relnum."' .. separator .. '":""}' ..
    '%#LineNr0#%{(v:relnum == 0)?v:lnum." ' .. separator .. '":""}'

vim.api.nvim_set_hl(0, "LineNr0", { fg = "#dedede" })
vim.api.nvim_set_hl(0, "LineNr1", { fg = "#bdbdbd" })
vim.api.nvim_set_hl(0, "LineNr2", { fg = "#9c9c9c" })
vim.api.nvim_set_hl(0, "LineNr3", { fg = "#7b7b7b" })
vim.api.nvim_set_hl(0, "LineNr4", { fg = "#5a5a5a" })

vim.api.nvim_create_autocmd("FileType", {
  pattern = "netrw",
  callback = function()
    local opts = { buffer = true, remap = true }
    vim.keymap.set("n", "l", "<Plug>NetrwLocalBrowseCheck", opts)
    vim.keymap.set("n", "h", "-", opts)
  end,
})
