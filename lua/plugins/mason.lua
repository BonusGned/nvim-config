return {
	{
		"williamboman/mason.nvim",
		config = function()
			require('mason').setup()
		end
	},
	{
		'williamboman/mason-lspconfig.nvim',
		config = function()
			require("mason-lspconfig").setup(
			{
                automatic_enable = true,
				ensure_installed = { "lua_ls", "rust_analyzer", "gopls" , "pyright", "ts_ls"}
			})
		end
	}
}
