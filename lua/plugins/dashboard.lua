return {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    config = function()
        require("dashboard").setup({
            -- HYPER CONFIG
            -- theme = "hyper",
            -- config = {
            --     week_header = {
            --         enable = true,
            --     },
            --     shortcut = {
            --         { desc = "󰊳 Update", group = "@property", action = "Lazy update", key = "u" },
            --         {
            --             icon = " ",
            --             icon_hl = "@variable",
            --             desc = "Files",
            --             group = "Label",
            --             action = "Telescope find_files",
            --             key = "f",
            --         },
            --         {
            --             desc = " Menu",
            --             group = "DiagnosticHint",
            --             action = "Neotree left toggle reveal",
            --             key = "e",
            --         },
            --     },
            -- },
            -- DOOM config
            theme = 'doom',
            config = {
                header = {}, --your header
                center = {
                    {
                        icon = ' ',
                        icon_hl = 'Title',
                        desc = 'Find File           ',
                        desc_hl = 'String',
                        key = 'b',
                        keymap = 'SPC f f',
                        key_hl = 'Number',
                        key_format = ' %s', -- remove default surrounding `[]`
                        action = 'lua print(2)'
                    },
                    {
                        icon = ' ',
                        desc = 'Find Dotfiles',
                        key = 'f',
                        keymap = 'SPC f d',
                        key_format = ' %s', -- remove default surrounding `[]`
                        action = 'lua print(3)'
                    },
                },
                footer = {} --your footer
            }
        })
    end,
    dependencies = { { "nvim-tree/nvim-web-devicons" } },
}
