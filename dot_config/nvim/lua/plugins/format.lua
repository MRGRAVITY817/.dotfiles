return {
	{
		"stevearc/conform.nvim",
		opts = {},
		config = function()
			require("conform").setup({
				formatters_by_ft = {
					python = { "isort", "black" },
					lua = { "stylua" },
					javascript = { "prettier", "prettierd" },
					elixir = { "mix" },
					clojure = { "cljstyle" },
				},
			})
		end,
	},
	{
		"mfussenegger/nvim-lint",
		optional = true,
		opts = function(_, opts)
			if vim.fn.executable("credo") == 0 then
				return
			end
			opts.linters_by_ft = {
				elixir = { "credo" },
			}
		end,
	},
}
