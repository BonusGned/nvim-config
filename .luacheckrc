-- Ignore vim global entirely - Neovim configs need to write to vim.opt, vim.g, etc.
std = "lua51+luajit"
globals = {
    "vim",
}

-- Configure luacheck
max_line_length = 120

-- Ignore "setting read-only field" warnings for vim subfields
-- This is expected in Neovim configuration files
ignore = {
    "122", -- Setting read-only field of global variable
}
