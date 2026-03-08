return {
    -- File tree
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        },
        opts = {
            window = { width = 30 },
            filesystem = {
                filtered_items = {
                    hide_dotfiles = false,
                    hide_gitignored = false,
                },
            },
        },
    },

    -- Fuzzy finder
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        },
        opts = {
            defaults = {
                prompt_prefix = "  ",
                selection_caret = " ",
                border = true,
                borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
            },
        },
    },

    -- Treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        main = "nvim-treesitter.configs",
        opts = {
            ensure_installed = { "lua", "python", "javascript", "typescript", "bash", "json", "yaml", "markdown" },
            highlight = { enable = true },
            indent = { enable = true },
            auto_install = true,
        },
    },

    -- Git signs
    {
        "lewis6991/gitsigns.nvim",
        opts = {
            signs = {
                add    = { text = "▎" },
                change = { text = "▎" },
                delete = { text = "" },
            },
        },
    },

    -- Auto pairs
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        opts = {},
    },

    -- Comments
    {
        "numToStr/Comment.nvim",
        opts = {},
    },

    -- Surround
    {
        "kylechui/nvim-surround",
        event = "VeryLazy",
        opts = {},
    },

    -- Terminal
    {
        "akinsho/toggleterm.nvim",
        opts = {
            size = 15,
            direction = "horizontal",
            border = "rounded",
            shell = "zsh",
        },
    },

    -- Mini plugins
    {
        "echasnovski/mini.nvim",
        config = function()
            require("mini.ai").setup()
            require("mini.move").setup()
        end,
    },
}
