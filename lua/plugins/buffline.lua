return {
    {
        'akinsho/bufferline.nvim',
        version = "*",
        dependencies = 'nvim-tree/nvim-web-devicons',
        config = function()
            local bufferline = require("bufferline")

            bufferline.setup({
                options = {
                    mode = "buffers",
                    numbers = "none",
                    color_icons = false,
                    indicator = {
                        style = "none",
                    },
                    modified_icon = "●",
                    left_trunc_marker = "",
                    right_trunc_marker = "",
                    diagnostics = "nvim_lsp",
                    diagnostics_indicator = function(_count, _level, diagnostics_dict, _context)
                        local s = " "
                        for e, _ in pairs(diagnostics_dict) do
                            local sym = e == "error" and " " or (e == "warning" and " " or " ")
                            s = s .. sym
                        end
                        return s
                    end,
                    always_show_bufferline = true,
                },
                highlights = {
                    background = {
                        fg = "#585b70",
                    },
                    buffer_selected = {
                        fg = "#89dceb",
                    },
                    buffer_visible = {
                        fg = "#585b70",
                    },
                    separator = {
                        bg = "#1e1e2e",
                        fg = "#1e1e2e",
                    },
                    diagnostic = {},
                },
            })
        end,
    }
}
