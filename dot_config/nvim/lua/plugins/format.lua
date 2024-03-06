return {
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
}
