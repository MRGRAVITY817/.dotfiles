return {
	{
		"Olical/conjure",
		ft = { "clojure", "fennel", "python", "scheme", "hy" }, -- etc
		-- [Optional] cmp-conjure for cmp
		dependencies = {
			{
				"PaterJason/cmp-conjure",
				config = function()
					local cmp = require("cmp")
					local config = cmp.get_config()
					table.insert(config.sources, {
						name = "buffer",
						option = {
							sources = {
								{ name = "conjure" },
							},
						},
					})
					cmp.setup(config)
				end,
			},
		},
		config = function(_, opts)
			require("conjure.main").main()
			require("conjure.mapping")["on-filetype"]()
			require("lspconfig").clojure_lsp.setup({
				filetypes = { "clojure", "edn", "cljd" },
			})
		end,
		init = function()
			-- Set the default height for horizontal splits
			vim.o.winheight = 10
			-- Set the default width for vertical splits
			vim.o.winwidth = 40

			-- Verbose output
			-- vim.g["conjure#debug"] = true

			-- Rebind it from K to <prefix>gk
			vim.g["conjure#mapping#doc_word"] = "gk"
			-- Local leader should be "Space"
			vim.g.maplocalleader = " "
		end,
	},
	{ "tpope/vim-dispatch" },
	{ "clojure-vim/vim-jack-in" },
	{ "tpope/vim-repeat" },
	{
		"julienvincent/nvim-paredit",
		config = function()
			require("nvim-paredit").setup({
				filetypes = { "clojure", "cljd" },
			})
		end,
	},
}
