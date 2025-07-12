local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.2",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	{ "cooperuser/glowbeam.nvim" },
	{ "joshdick/onedark.vim" },
	{ "nvim-treesitter/nvim-treesitter" },
	{ "neovim/nvim-lspconfig" },
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "hrsh7th/cmp-buffer" },
	{ "hrsh7th/cmp-path" },
	{ "hrsh7th/cmp-cmdline" },
	{ "hrsh7th/nvim-cmp" },
	{ "lewis6991/gitsigns.nvim" },
	{
		"nvim-lualine/lualine.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
			"linrongbin16/lsp-progress.nvim",
		},
	},
	{ "nvim-tree/nvim-web-devicons" },
	{ "williamboman/mason.nvim", build = ":MasonUpdate" },
	{ "akinsho/toggleterm.nvim", version = "*", config = true },
	{ "nvimtools/none-ls.nvim", lazy = false, dependencies = { "nvimtools/none-ls-extras.nvim" } },
	{ "windwp/nvim-autopairs" },
	{ "Djancyp/outline" },
	{ "terrortylor/nvim-comment" },
	{ "windwp/nvim-ts-autotag" },
	{ "akinsho/bufferline.nvim", dependencies = { "nvim-tree/nvim-web-devicons" } },
	{ "hrsh7th/cmp-nvim-lsp-signature-help" },
	{
		"linrongbin16/lsp-progress.nvim",
		event = { "VimEnter" },
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("lsp-progress").setup()
		end,
	},
	{
		"glepnir/dashboard-nvim",
		event = "VimEnter",
		dependencies = { { "nvim-tree/nvim-web-devicons" } },
	},
	{ "folke/which-key.nvim" },
	{ "phaazon/hop.nvim" },
	{ "hrsh7th/vim-vsnip" },
	{ "hrsh7th/vim-vsnip-integ" },
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = {
			indent = {
				char = "|",
				tab_char = { "|" },
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
	{ "ggandor/leap.nvim" },
	{ "tpope/vim-fugitive" },
	{ "rbong/vim-flog" },
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	{
		"Exafunction/codeium.vim",
		enabled = true,
		event = "BufEnter",
		config = function()
			-- Change '<C-g>' here to any keycode you like.
			vim.keymap.set("i", "<C-a>", function()
				return vim.fn["codeium#Accept"]()
			end, { expr = true })
			vim.keymap.set("i", "<C-]>", function()
				return vim.fn["codeium#CycleCompletions"](1)
			end, { expr = true })
			vim.keymap.set("i", "<C-[>", function()
				return vim.fn["codeium#CycleCompletions"](-1)
			end, { expr = true })
			vim.keymap.set("i", "<C-x>", function()
				return vim.fn["codeium#Clear"]()
			end, { expr = true })
		end,
	},
	{
		"nvim-tree/nvim-tree.lua",
		version = "*",
		lazy = false,
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("nvim-tree").setup({})
		end,
	},
	{
		"iamcco/markdown-preview.nvim",
		event = "BufRead",
		enabled = true,
		lazy = false,
		ft = { "markdown" },
		config = function()
			vim.fn["mkdp#util#install"]()
		end,
	},
})
