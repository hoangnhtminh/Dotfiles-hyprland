return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        opts = {
            flavour = "mocha",
            transparent_background = true,
            integrations = {
                neo_tree = true,
                telescope = { enabled = true },
                which_key = true,
                treesitter = true,
                cmp = true,
                gitsigns = true,
                mini = { enabled = true },
            },
        },
        init = function()
            vim.cmd.colorscheme("catppuccin")
        end,
    },
}
