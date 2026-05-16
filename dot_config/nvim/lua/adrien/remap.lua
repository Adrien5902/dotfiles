vim.g.mapleader = " "
vim.keymap.set("n", "<leader>ev", vim.cmd.Ex)

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

