-- every spec file under the "plugins" directory will be loaded automatically by lazy.nvim

return {
    -- Color scheme
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        lazy = false,
        opts = {
            flavour = "mocha",
            transparent_background = true, -- blend with the terminal / tmux background
            float = { transparent = false, solid = false },
            integrations = {
                fzf = true,
                neotree = true,
                which_key = true,
                mini = { enabled = true },
            },
        },
        config = function(_, opts)
            require("catppuccin").setup(opts)
            vim.cmd.colorscheme("catppuccin")
        end,
    },

    -- Statusline + buffer list in the tabline
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {
            options = {
                theme = "catppuccin-nvim",
                globalstatus = true,
                component_separators = { left = "", right = "" },
                section_separators = { left = "", right = "" },
            },
            sections = {
                lualine_a = { { "mode", separator = { left = "" }, right_padding = 2 } },
                lualine_b = { "branch", "diff" },
                lualine_c = { { "filename", path = 1 } },
                lualine_x = { "encoding", "fileformat", "filetype" },
                lualine_y = { "progress" },
                lualine_z = { { "location", separator = { right = "" }, left_padding = 2 } },
            },
            tabline = {
                lualine_a = {
                    {
                        "buffers",
                        separator = { left = "", right = "" },
                        symbols = { modified = " ●", alternate_file = "", directory = "" },
                    },
                },
            },
            extensions = { "neo-tree", "fzf", "lazy" },
        },
    },
}
