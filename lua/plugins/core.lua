-- every spec file under the "plugins" directory will be loaded automatically by lazy.nvim

return {
    -- Main color scheme
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        lazy = false,
        config = function()
            -- load the colorscheme here
            vim.cmd([[colorscheme catppuccin]])
        end
    },

    -- Devicons
    { "nvim-tree/nvim-web-devicons", opts = {} },

    -- File Explorer
    -- {
    --     "nvim-tree/nvim-tree.lua",
    --     version = "*",
    --     lazy = false,
    --     dependencies = {
    --         "nvim-tree/nvim-web-devicons",
    --     },
    --     config = function()
    --         require("nvim-tree").setup {}
    --     end,
    -- },

    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
            -- {"3rd/image.nvim", opts = {}}, -- Optional image support in preview window: See `# Preview Mode` for more information
        },
        lazy = false, -- neo-tree will lazily load itself
        ---@module "neo-tree"
        ---@type neotree.Config?
        opts = {
            -- fill any relevant options here
        },
    },

    -- fzf-lua
    {
        "ibhagwan/fzf-lua",
        -- optional for icon support
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {
            winopts = {
                preview = {
                    layout = "vertical",
                    hidden = true
                },
            },
        }
    },

    -- Tree-sitter
    { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
}
