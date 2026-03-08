return {
    -- Statusline
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {
            options = {
                theme = "catppuccin",
                component_separators = "|",
                section_separators = { left = "", right = "" },
                globalstatus = true,
            },
            sections = {
                lualine_a = { { "mode", separator = { left = "" }, right_padding = 2 } },
                lualine_b = { "branch", "diff", "diagnostics" },
                lualine_c = { { "filename", path = 1 } },
                lualine_x = { "encoding", "fileformat", "filetype" },
                lualine_y = { "progress" },
                lualine_z = { { "location", separator = { right = "" }, left_padding = 2 } },
            },
        },
    },

    -- Bufferline
    {
        "akinsho/bufferline.nvim",
        dependencies = "nvim-tree/nvim-web-devicons",
        opts = {
            options = {
                diagnostics = "nvim_lsp",
                separator_style = "slant",
                offsets = {
                    { filetype = "neo-tree", text = "File Explorer", highlight = "Directory", separator = true }
                },
            },
        },
    },

    -- Dashboard
    {
        "nvimdev/dashboard-nvim",
        event = "VimEnter",
        opts = {
            theme = "doom",
            config = {
                header = {
                    "",
                    "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗  ",
                    "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║  ",
                    "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║  ",
                    "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║  ",
                    "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║  ",
                    "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝  ",
                    "",
                },
                center = {
                    { icon = "  ", desc = "Find File       ", key = "f", action = "Telescope find_files" },
                    { icon = "  ", desc = "Recent Files    ", key = "r", action = "Telescope oldfiles" },
                    { icon = "  ", desc = "Live Grep       ", key = "g", action = "Telescope live_grep" },
                    { icon = "  ", desc = "File Tree       ", key = "e", action = "Neotree toggle" },
                    { icon = "  ", desc = "New File        ", key = "n", action = "enew" },
                    { icon = "󰒲  ", desc = "Lazy            ", key = "l", action = "Lazy" },
                    { icon = "  ", desc = "Quit            ", key = "q", action = "qa" },
                },
                footer = { "", "  Neovim loaded fast. Happy coding!" },
            },
        },
    },

    -- Indent guides
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        opts = {
            indent = { char = "│" },
            scope = { enabled = true },
        },
    },

    -- Which key
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        opts = { delay = 500 },
    },

    -- Notifications
    {
        "rcarriga/nvim-notify",
        opts = {
            background_colour = "#1a1512",
            timeout = 3000,
            render = "compact",
        },
        init = function()
            vim.notify = require("notify")
        end,
    },

    -- Noice (better UI for messages/cmdline)
    {
        "folke/noice.nvim",
        dependencies = { "MunifTanjim/nui.nvim", "rcarriga/nvim-notify" },
        opts = {
            lsp = {
                override = {
                    ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                    ["vim.lsp.util.stylize_markdown"] = true,
                },
            },
            presets = {
                bottom_search = true,
                command_palette = true,
                long_message_to_split = true,
            },
        },
    },
}
