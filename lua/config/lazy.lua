-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out, "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

-- Main NEOVIM configuration

vim.opt.shortmess = vim.opt.shortmess + "I" -- disable intro message on vim open

-- Persistent undo settings
vim.opt.undofile = true
vim.opt.undodir = vim.fn.stdpath("config") .. "/undo"
vim.opt.undolevels = 1000
vim.opt.undoreload = 10000

-- Searching
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true

-- Command menu
vim.opt.wildmode = "list:longest,full"
vim.opt.pumheight = 10

-- Spaces and Tabs
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.expandtab = true

-- UI
vim.opt.syntax = "on"
vim.opt.number = true
vim.opt.scrolloff = 3
vim.opt.virtualedit = "onemore"

-- Color design
vim.opt.termguicolors = true

-- Mark tabs and trailing spaces
vim.cmd([[ set list listchars=tab:>-,trail:~,extends:>,precedes:< ]])

-- Disable automatic comments
vim.cmd([[ autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o ]])

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
-- vim.g.mapleader = ","
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
    spec = {
        -- import your plugins
        { import = "plugins" },
    },
    -- Configure any other settings here. See the documentation for more details.
    -- colorscheme that will be used when installing plugins.
    install = { colorscheme = { "habamax" } },
    -- automatically check for plugin updates
    checker = { enabled = true },
})

-- Keymaps

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Plugin keymaps

-- nvim-tree
-- map('n', '<C-n>', ':NvimTreeToggle<CR>', { desc = "Toggle file explorer (nvim-tree)", unpack(opts) })
map('n', '<C-n>', '<Cmd>Neotree float toggle<CR>', opts)

-- Plugin keymaps
map('n', '<leader>f', function() require('fzf-lua').files() end, { desc = "Find files (fzf-lua)", unpack(opts) })
map('n', '<leader>b', function() require('fzf-lua').buffers() end, { desc = "List buffers (fzf-lua)", unpack(opts) })
local grep_opts = { winopts = { preview = { hidden = false } } }
map('n', '<leader>g', function() require('fzf-lua').live_grep(grep_opts) end, { desc = "Live grep (ripgrep via fzf-lua)", unpack(opts) })

-- Buffer navigation
map('n', '<leader>w', ':bp<bar>bd #<CR>', { desc = "Close buffer", silent = true })
map('n', '<leader>s', ':w<CR>', { desc = "Save file" })
map('n', '<C-l>', ':bn<CR>', { desc = "Next buffer" })
map('n', '<C-h>', ':bp<CR>', { desc = "Previous buffer" })

