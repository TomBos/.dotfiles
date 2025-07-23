return {
	{
		"stevearc/conform.nvim",
		opts = require "configs.conform",
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			require "configs.lspconfig"
		end,
	},
	{
		"folke/which-key.nvim",
		enabled = false,
	},
}
