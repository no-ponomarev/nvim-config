-- every spec file under the "plugins" directory will be loaded automatically by lazy.nvim

return {
    -- Devicons
    { "nvim-tree/nvim-web-devicons", lazy = true, opts = {} },

    -- File explorer
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        },
        lazy = false, -- neo-tree will lazily load itself
        keys = {
            { "<C-n>", "<Cmd>Neotree float toggle<CR>", desc = "File explorer (neo-tree)" },
        },
        ---@module "neo-tree"
        ---@type neotree.Config?
        opts = {
            popup_border_style = "rounded",
            enable_git_status = false,
            enable_diagnostics = false,
        },
    },

    -- Fuzzy finder
    {
        "ibhagwan/fzf-lua",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        cmd = "FzfLua",
        keys = {
            { "<leader>f", function() require("fzf-lua").files() end, desc = "Find files" },
            { "<leader>b", function() require("fzf-lua").buffers() end, desc = "List buffers" },
            {
                "<leader>g",
                function() require("fzf-lua").live_grep({ winopts = { preview = { hidden = false } } }) end,
                desc = "Live grep",
            },
        },
        opts = {
            winopts = {
                preview = {
                    layout = "vertical",
                    hidden = true,
                },
            },
        },
    },

    -- Tree-sitter (main branch: needs the `tree-sitter` CLI and a C compiler)
    {
        "nvim-treesitter/nvim-treesitter",
        branch = "main",
        lazy = false,
        build = ":TSUpdate",
        config = function()
            require("nvim-treesitter").install({
                "bash", "c", "cmake", "cpp", "diff", "gitcommit", "git_rebase", "gitignore",
                "json", "lua", "make", "markdown", "markdown_inline", "python", "query",
                "regex", "toml", "vim", "vimdoc", "yaml",
            })
            -- Highlight every buffer whose language has a parser installed
            vim.api.nvim_create_autocmd("FileType", {
                group = vim.api.nvim_create_augroup("user_treesitter", { clear = true }),
                callback = function(args)
                    pcall(vim.treesitter.start, args.buf)
                end,
            })
        end,
    },

    -- Close a buffer without closing its window / breaking the layout
    {
        "nvim-mini/mini.bufremove",
        version = "*",
        keys = {
            { "<leader>w", function() require("mini.bufremove").delete(0, false) end, desc = "Close buffer" },
        },
        opts = {},
    },

    -- Popup listing available keymaps (uses each mapping's desc)
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        opts = { preset = "modern" },
    },
}
