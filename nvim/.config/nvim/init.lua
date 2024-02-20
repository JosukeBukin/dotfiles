local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup({
    'nvimdev/lspsaga.nvim',
    config = function()
        require('lspsaga').setup({})
    end,
    dependencies = {
	'nvim-treesitter/nvim-treesitter',-- optional
        'nvim-tree/nvim-web-devicons'     -- optional
    },
    'neovim/nvim-lspconfig',
    'ms-jpq/coq_nvim',
    config = function()
        require('coq_nvim').setup({})
    end,
    dependencies = {
	'ms-jpq/coq.artifacts', -- 9000+ Snippets
        'ms-jpq/coq.thirdparty' -- Lua & thirdparty sources    
    },
    'catppuccin/nvim', name = 'catppuccin', priority = 1000,
    'freddiehaddad/feline.nvim',
})

-- LSP Configuration
require('lspconfig').rust_analyzer.setup {
    handlers = {
        ["textDocument/publishDiagnostics"] = vim.lsp.with(
            vim.lsp.diagnostic.on_publish_diagnostics, {
            -- Disable virtual_text
            virtual_text = false
          }
        ),
    }
}
require'lspconfig'.ccls.setup{}
vim.cmd('COQnow -s')

vim.cmd.colorscheme "catppuccin"
vim.opt.termguicolors = true
local ctp_feline = require('catppuccin.groups.integrations.feline')
local clrs = require("catppuccin.palettes").get_palette()
ctp_feline.setup({
    assets = {
        left_separator = "",
        right_separator = "",
        mode_icon = "",
        dir = "󰉖",
        file = "󰈙",
        lsp = {
            server = "󰅡",
            error = "",
            warning = "",
            info = "",
            hint = "",
        },
        git = {
            branch = "",
            added = "",
            changed = "",
            removed = "",
        },
    },
    sett = {
        diffs = clrs.mauve,
        extras = clrs.overlay1,
        curr_file = clrs.maroon,
        curr_dir = clrs.flamingo,
        show_modified = true -- show if the file has been modified
    },
    mode_colors = {
        ["n"] = { "NORMAL", clrs.lavender },
        ["no"] = { "N-PENDING", clrs.lavender },
        ["i"] = { "INSERT", clrs.green },
        ["ic"] = { "INSERT", clrs.green },
        ["t"] = { "TERMINAL", clrs.green },
        ["v"] = { "VISUAL", clrs.flamingo },
        ["V"] = { "V-LINE", clrs.flamingo },
        ["�"] = { "V-BLOCK", clrs.flamingo },
        ["R"] = { "REPLACE", clrs.maroon },
        ["Rv"] = { "V-REPLACE", clrs.maroon },
        ["s"] = { "SELECT", clrs.maroon },
        ["S"] = { "S-LINE", clrs.maroon },
        ["�"] = { "S-BLOCK", clrs.maroon },
        ["c"] = { "COMMAND", clrs.peach },
        ["cv"] = { "COMMAND", clrs.peach },
        ["ce"] = { "COMMAND", clrs.peach },
        ["r"] = { "PROMPT", clrs.teal },
        ["rm"] = { "MORE", clrs.teal },
        ["r?"] = { "CONFIRM", clrs.mauve },
        ["!"] = { "SHELL", clrs.green },
    }
})
require("feline").setup({
    components = ctp_feline.get(),
})
require('feline').winbar.setup()       -- to use winbar

-- Numbers
vim.opt.number = true           -- Show line number
vim.opt.relativenumber = true   -- Show relative line numbers
-- Tabs, indent
vim.opt.expandtab = true        -- Use spaces instead of tabs
vim.opt.shiftwidth = 4          -- Shift 4 spaces when tab
vim.opt.tabstop = 4             -- 1 tab == 4 spaces
vim.opt.smartindent = true      -- Autoindent new lines
-- Memory, CPU
vim.opt.hidden = true           -- Enable background buffers
vim.opt.history = 100           -- Remember N lines in history
vim.opt.lazyredraw = true       -- Faster scrolling
vim.opt.synmaxcol = 240         -- Max column for syntax highlight
vim.opt.updatetime = 250        -- ms to wait for trigger an event
