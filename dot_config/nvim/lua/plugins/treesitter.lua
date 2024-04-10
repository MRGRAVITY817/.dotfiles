return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			local config = require("nvim-treesitter.configs")
			config.setup({
				auto_install = false,
				ensure_installed = {
					"lua",
					"html",
					"javascript",
					"typescript",
					"svelte",
					"vue",
					"tsx",
					"xml",
					"markdown",
					"astro",
					"rust",
					"toml",
					"yaml",
					"json",
					"elixir",
					"heex",
					"eex",
					"markdown",
					"fennel",
					"clojure",
					"scheme",
					"racket",
					"gleam",
				},
				ignore_install = {
					"dart",
					"swift",
				},
				highlight = {
					enable = true,
					additional_vim_regex_highlighting = false,
				},
				indent = { enable = true },
				filetype_extensions = {
					-- Use clojure parser for clojuredart
					clojure = { "cljd" },
				},
			})

			-- Manually set filetype for .cljd files
			vim.filetype.add({
				extension = {
					cljd = "clojure",
				},
			})
		end,
	},
	{
		"windwp/nvim-ts-autotag",
		opts = {},
	},
}
