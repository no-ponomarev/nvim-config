-- Autocommands

local group = vim.api.nvim_create_augroup("user_config", { clear = true })

-- Don't continue comments on new lines
vim.api.nvim_create_autocmd("FileType", {
    group = group,
    callback = function()
        vim.opt_local.formatoptions:remove({ "c", "r", "o" })
    end,
})

-- Briefly highlight yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
    group = group,
    callback = function()
        vim.hl.on_yank({ timeout = 200 })
    end,
})
