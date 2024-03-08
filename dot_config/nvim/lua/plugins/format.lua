return {
	{
		"stevearc/conform.nvim",
		opts = {},
		config = function()
			require("conform").setup({
				formatters_by_ft = {
					python = { "isort", "black" },
					lua = { "stylua" },
					javascript = { "biome" },
					typescript = { "biome" },
					typescript_react = { "biome" },
					javascript_react = { "biome" },
					elixir = { "mix" },
					clojure = { "cljstyle" },
				},
			})

			vim.api.nvim_create_autocmd("BufWritePre", {
				pattern = "*",
				callback = function(args)
					require("conform").format({ bufnr = args.buf })
				end,
			})
		end,
	},
	{
		"mfussenegger/nvim-lint",
		optional = true,
		config = function()
			require("lint").linters_by_ft = {
				python = { "flake8", "mypy" },
				lua = { "luacheck" },
				javascript = { "eslint" },
				elixir = { "credo" },
				clojure = { "clj-kondo" },
			}

			vim.api.nvim_create_autocmd({ "BufWritePost" }, {
				callback = function(args)
					require("lint").try_lint()
				end,
			})
		end,
	},
}
