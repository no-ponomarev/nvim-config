-- General keymaps (plugin keymaps live in their specs under lua/plugins/)

local map = vim.keymap.set

map("n", "<leader>s", "<Cmd>write<CR>", { desc = "Save file" })
map("n", "<C-l>", "<Cmd>bnext<CR>", { desc = "Next buffer" })
map("n", "<C-h>", "<Cmd>bprevious<CR>", { desc = "Previous buffer" })
