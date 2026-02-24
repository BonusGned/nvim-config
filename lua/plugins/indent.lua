return {
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        opts = {
            indent = {
                -- char = "|",
                -- tab_char = { "|" },
                -- highlight = { "Function", "Label" },
                smart_indent_cap = true,
                priority = 2,
            },
            scope = {
                enabled = false,
            },
            exclude = {
                filetypes = {
                    "help",
                    "packer",
                    "nvimtree",
                    "dashboard",
                    "neo-tree",
                },
                buftypes = {
                    "terminal",
                    "nofile",
                    "quickfix",
                },
            },
        },
    },
}
