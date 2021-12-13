vim.o.number = true
vim.o.relativenumber = true
vim.o.syntax = 'on' 

-- Colorscheme
vim.o.termguicolors = true
vim.o.background = "dark" -- or "light" for light mode
vim.cmd([[colorscheme gruvbox]])


vim.o.swapfile = false
vim.o.expandtab = true
vim.o.smarttab = true
vim.o.shiftwidth = 4
vim.o.hidden = true
vim.o.backup = false 
vim.o.writebackup = false 
vim.o.cmdheight = 2
vim.o.updatetime = 300
vim.o.signcolumn = 'yes'

vim.o.splitbelow = true
vim.o.splitright = true

vim.o.completeopt = 'menuone', 'noinsert', 'noselect'

require'nvim-treesitter.configs'.setup {
    highlight = {enable = true},
    incremental_selection = {enable = true},
    textobjects = {enable = true},
    indent = {enable = true},
}

vim.cmd([[
    let g:deoplete#enable_at_startup = 1
]])
