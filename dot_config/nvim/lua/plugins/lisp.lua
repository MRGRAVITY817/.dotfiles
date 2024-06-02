return {
	{
		"Olical/conjure",
		ft = { "clojure", "fennel", "python", "scheme", "hy", "lisp" }, -- etc
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
			local paredit = require("nvim-paredit")

			paredit.setup({
				filetypes = { "clojure", "cljd", "commonlisp" },
				extensions = {
					commonlisp = {
						-- Should return the 'root' of the given Treesitter node. For example:
						-- The node at cursor in the below example is `()` or 'list_lit':
						--   '(|)
						-- But the node root is `'()` or 'quoting_lit'
						get_node_root = function(node) end,
						-- This is the inverse of `get_node_root` for forms and should find the inner node for which
						-- the forms elements are direct children.
						--
						-- For example given the node `'()` or 'quoting_lit', this function should return `()` or 'list_lit'.
						unwrap_form = function(node) end,
						-- Accepts a Treesitter node and should return true or false depending on whether the given node
						-- can be considered a 'form'
						node_is_form = function(node) end,
						-- Accepts a Treesitter node and should return true or false depending on whether the given node
						-- can be considered a 'comment'
						node_is_comment = function(node) end,
						-- Accepts a Treesitter node representing a form and should return the 'edges' of the node. This
						-- includes the node text and the range covered by the node
						get_form_edges = function(node)
							return {
								left = { text = "#{", range = { 0, 0, 0, 2 } },
								right = { text = "}", range = { 0, 5, 0, 6 } },
							}
						end,
					},
				},
			})
		end,
	},
}
