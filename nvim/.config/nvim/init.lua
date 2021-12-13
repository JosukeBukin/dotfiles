require('plugins')
require('settings')

vim.o.splitbelow = true
vim.o.splitright = true

vim.g['maplocalleader'] = ']'

-- Keybindings
vim.api.nvim_set_keymap('n', '<F8>', ':NERDTreeToggle<CR>', {noremap = true})
