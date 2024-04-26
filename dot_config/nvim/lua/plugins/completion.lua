return {
	{
		"hrsh7th/cmp-nvim-lsp",
	},
	{
		"github/copilot.vim",
	},
	{
		"L3MON4D3/LuaSnip",
		dependencies = {
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets",
		},
		config = function()
			local ls = require("luasnip")
			local s = ls.snippet
			local t = ls.text_node
			local i = ls.insert_node
			local f = ls.function_node

			local function copy(args)
				return args[1]
			end

			ls.filetype_extend("elixir", { "eex", "heex" })

			ls.add_snippets("clojure", {
				s("fn", {
					-- Simple static text.
					t("//Parameters: "),
					-- function, first parameter is the function, second the Placeholders
					-- whose text it gets as input.
					f(copy, 2),
					t({ "", "function " }),
					-- Placeholder/Insert.
					i(1),
					t("("),
					-- Placeholder with initial text.
					i(2, "int foo"),
					-- Linebreak
					t({ ") {", "\t" }),
					-- Last Placeholder, exit Point of the snippet.
					i(0),
					t({ "", "}" }),
				}),
			})
		end,
	},
	{
		"hrsh7th/nvim-cmp",
		config = function()
			local cmp = require("cmp")
			require("luasnip.loaders.from_vscode").lazy_load()

			cmp.setup({
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				mapping = cmp.mapping.preset.insert({
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({ select = true }),
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "luasnip" }, -- For luasnip users.
				}, {
					{ name = "buffer" },
				}),
			})
		end,
	},
}
