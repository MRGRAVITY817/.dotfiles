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
		workspaces = {
			{
				name = "second brain",
				path = "~/Notes",
			},
		},

		-- see below for full list of options 👇
		ui = {
			enable = false,
		},
	},
}
