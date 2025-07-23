return {
	{
		"stevearc/conform.nvim",
		enabled = false,
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
	{
		"hrsh7th/nvim-cmp",
		enabled = false 
	},
	{
		"hrsh7th/cmp-nvim-lsp",
		enabled = false 
	},
	{
		"hrsh7th/cmp-buffer",
		enabled = false 
	},
	{
		"hrsh7th/cmp-nvim-lua",
		enabled = false 
	},
	{
		"hrsh7th/cmp-async-path",
		enabled = false 
	},
	{
		"saadparwaiz1/cmp_luasnip",
		enabled = false 
	},
}
