-- Options

local opt = vim.opt

-- Leader keys (set before lazy.nvim loads so plugin mappings pick them up)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

opt.shortmess:append("I") -- no intro message

-- Persistent undo (stored in ~/.local/state/nvim/undo)
opt.undofile = true

-- Searching
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true
opt.inccommand = "split" -- live preview of :s substitutions

-- Command-line completion & popup menu
opt.wildmode = "list:longest,full"
opt.pumheight = 10

-- Spaces and tabs
opt.shiftwidth = 4
opt.tabstop = 4
opt.expandtab = true
opt.breakindent = true -- wrapped lines keep their indentation

-- UI
opt.termguicolors = true
opt.number = true
-- opt.relativenumber = true
opt.cursorline = true
opt.signcolumn = "yes" -- fixed gutter, text never shifts sideways
opt.scrolloff = 8
opt.virtualedit = "onemore"
opt.splitright = true
opt.splitbelow = true
opt.laststatus = 3 -- one global statusline
opt.showmode = false -- lualine already shows the mode
opt.winborder = "rounded" -- rounded borders for floating windows
opt.updatetime = 250

-- Show tabs, trailing spaces, non-breaking spaces
opt.list = true
opt.listchars = { tab = "→ ", trail = "·", nbsp = "␣", extends = "›", precedes = "‹" }

-- System clipboard (WSL: win32yank.exe on PATH; elsewhere stay with vim registers)
if vim.fn.executable("win32yank.exe") == 1 then
    opt.clipboard = "unnamedplus"
end
