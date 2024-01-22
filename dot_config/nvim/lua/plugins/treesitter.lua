return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local config = require("nvim-treesitter.configs")
		config.setup({
			auto_install = true,
			ensure_installed = {
				"lua",
				"javascript",
				"typescript",
				"tsx",
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
		})
	end,
}
