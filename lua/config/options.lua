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

-- System clipboard
if vim.env.SSH_TTY then
    -- Remote over SSH: "+y copies to the local clipboard via OSC 52 (through local
    -- tmux, which needs `set-clipboard on`). Terminals refuse OSC 52 reads, so "+p
    -- just returns nvim's last yank; paste from the local clipboard with Ctrl+Shift+V.
    local osc52 = require("vim.ui.clipboard.osc52")
    local function paste()
        return { vim.fn.split(vim.fn.getreg('"'), "\n"), vim.fn.getregtype('"') }
    end
    vim.g.clipboard = {
        name = "OSC 52 (copy only)",
        copy = { ["+"] = osc52.copy("+"), ["*"] = osc52.copy("*") },
        paste = { ["+"] = paste, ["*"] = paste },
    }
end
