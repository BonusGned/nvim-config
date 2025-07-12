return {
	{
		"terrortylor/nvim-comment",
		config = function()
			local comment = require("nvim_comment")
			comment.setup({
				line_mapping = "<leader>cl",
				operator_mapping = "<leader>c",
			})
		end,
	},
}
