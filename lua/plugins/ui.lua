-- every spec file under the "plugins" directory will be loaded automatically by lazy.nvim

return {
    -- Lualine
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        -- opts needed for setup() init
        opts = {
            extensions = { 'nvim-tree', 'fzf' }
        }
    },

    -- Bufferline
    {
        'akinsho/bufferline.nvim',
        version = "*",
        dependencies = 'nvim-tree/nvim-web-devicons',
        -- opts needed for setup() init
        opts = {}
    },
}

