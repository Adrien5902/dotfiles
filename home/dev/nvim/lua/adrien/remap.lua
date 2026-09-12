vim.g.mapleader = " "
vim.keymap.set("n", "<leader>e", vim.cmd.Ex)

local telescope_builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', telescope_builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', telescope_builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fh', telescope_builtin.help_tags, { desc = 'Telescope help tags' })
vim.keymap.set('n', '<leader>fb', telescope_builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>cs', telescope_builtin.colorscheme, { desc = 'Nvim Colorscheme' })

-- NO ARROWS
vim.keymap.set('', '<Left>', '<Nop>', opts)
vim.keymap.set('', '<Right>', '<Nop>', opts)
vim.keymap.set('', '<Up>', '<Nop>', opts)
vim.keymap.set('', '<Down>', '<Nop>', opts)

-- Better split navigation
vim.keymap.set('n', '<C-h>', '<C-w>h', opts)
vim.keymap.set('n', '<C-j>', '<C-w>j', opts)
vim.keymap.set('n', '<C-k>', '<C-w>k', opts)
vim.keymap.set('n', '<C-l>', '<C-w>l', opts)

vim.keymap.set({ "n", "x" }, "<leader>gk", function()
	require("tiny-code-action").code_action()
end, { noremap = true, silent = true })

vim.keymap.set("n", "<leader>w", function()
	vim.opt.wrap = not vim.opt.wrap:get()
end, { desc = "Toggle line wrapping" })

vim.keymap.set('n', '<leader>i', function()
	vim.cmd("InlayHintsToggle")
end)

-- Text Case
local text_case = require("textcase")
local function to_case(case)
	return function()
		text_case.current_word("to_" .. case)
	end
end

vim.keymap.set("n", "<leader>cs", to_case("snake_case"))
vim.keymap.set("n", "<leader>ct", to_case("title_case"))
vim.keymap.set("n", "<leader>cc", to_case("camel_case"))
vim.keymap.set("n", "<leader>cu", to_case("upper_case"))
vim.keymap.set("n", "<leader>cl", to_case("lower_case"))
