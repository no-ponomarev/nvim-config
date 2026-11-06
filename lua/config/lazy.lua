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

-- Setup lazy.nvim (every file under lua/plugins/ is loaded automatically)
require("lazy").setup({
    spec = {
        { import = "plugins" },
    },
    -- colorscheme used while installing plugins on a fresh machine
    install = { colorscheme = { "catppuccin", "habamax" } },
    -- check for plugin updates in the background, run :Lazy update to apply
    checker = { enabled = true, notify = false },
})
