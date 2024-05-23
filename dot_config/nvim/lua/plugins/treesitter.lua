return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			local config = require("nvim-treesitter.configs")
			config.setup({
				auto_install = false,
				ensure_installed = {
					"astro",
					"clojure",
					"eex",
					"elixir",
					"fennel",
					"gleam",
					"graphql",
					"heex",
					"html",
					"http",
					"javascript",
					"json",
					"lua",
					"markdown",
					"racket",
					"rust",
					"scheme",
					"svelte",
					"toml",
					"tsx",
					"typescript",
					"vue",
					"xml",
					"yaml",
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
				autotag = {
					enable = true,
					enable_rename = true,
					enable_close = true,
					enable_close_on_slash = true,
				},
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
		config = function()
			require("nvim-ts-autotag").setup({
				filetypes = {
					"html",
					"javascript",
					"typescript",
					"javascriptreact",
					"typescriptreact",
					"svelte",
					"vue",
					"tsx",
					"jsx",
					"rescript",
					"xml",
					"php",
					"markdown",
					"astro",
					"glimmer",
					"handlebars",
					"hbs",
					"heex",
					"eex",
					"elixir",
				},
			})
		end,
	},
}
