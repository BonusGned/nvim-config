-- Allow Neovim globals
globals = {
    "vim",
    "require",
    "os",
    "io",
    "pairs",
    "ipairs",
    "pcall",
    "tonumber",
    "tostring",
    "type",
    "getfenv",
    "setmetatable",
    "coroutine",
    "string",
    "table",
    "math",
    "utf8",
}

-- Allow vim specific sub-modules (read-only)
read_globals = {
    "vim.api",
    "vim.fn",
    "vim.opt",
    "vim.g",
    "vim.keymap",
    "vim.lsp",
    "vim.diagnostic",
    "vim.notify",
    "vim.log",
    "vim.uv",
    "vim.loop",
    "vim.cmd",
    "vim.inspect",
    "vim.snippet",
    "vim.diagnostic.severity",
    "vim.v",
}

-- Allow writing to vim.bo, vim.wo, vim.opt, vim.g, vim.lsp.handlers
globals = {
    "vim.bo",
    "vim.wo",
    "vim.opt",
    "vim.g",
    "vim.lsp.handlers",
}

-- Configure luacheck
max_line_length = 120

-- Don't fail on warnings, only on errors
-- This is needed because setting vim options triggers "read-only field" warnings
-- which are expected behavior in Neovim configuration
quiet = 1
