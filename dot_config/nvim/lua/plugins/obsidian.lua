return {
	"epwalsh/obsidian.nvim",
	version = "*",
	lazy = true,
	ft = "markdown",
	dependencies = {
		-- Required.
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	opts = {
		-- workspaces = {
		-- 	{
		-- 		name = "personal",
		-- 		path = "~/vaults/personal",
		-- 	},
		-- 	{
		-- 		name = "work",
		-- 		path = "~/vaults/work",
		-- 	},
		-- },

		-- see below for full list of options 👇
		ui = {
			enable = false,
		},
	},
}
