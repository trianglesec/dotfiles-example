local telescope = require('telescope')

telescope.setup{
	defaults = {},
	pickers = {},
	extensions = {}
}

local opts = { noremap = true }
local builtin = '<cmd>lua require("telescope.builtin").'

vim.api.nvim_set_keymap('n', '<C-p>', builtin..'find_files()<CR>', opts)
vim.api.nvim_set_keymap('n', '<C-f>', builtin..'live_grep()<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>fb', builtin..'buffers()<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>fh', builtin..'help_tags()<CR>', opts)
-- vim.api.nvim_set_keymap('n', '<leader>q', builtin..'diagnostics()<CR>', opts)

