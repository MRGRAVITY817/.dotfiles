return {
	{
		"stevearc/conform.nvim",
		opts = {},
		config = function()
			require("conform").setup({
				formatters_by_ft = {
					python = { "isort", "black" },
					lua = { "stylua" },
					javascript = { { "prettierd", "prettier" } },
					elixir = { "mix" },
					clojure = { "cljstyle" },
				},
				format_on_save = {
					-- I recommend these options. See :help conform.format for details.
					lsp_fallback = true,
					timeout_ms = 500,
				},
			})

			-- vim.api.nvim_create_autocmd("BufWritePre", {
			-- 	pattern = "*",
			-- 	callback = function(args)
			-- 		require("conform").format({ bufnr = args.buf })
			-- 	end,
			-- })
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
