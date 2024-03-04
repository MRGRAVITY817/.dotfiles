-- None-ls is a plugin that provides a way to use LSP-like features without a language server.
-- It's a good way to use LSP-like features without a language server like:
-- - Credo(Static Analysis for Elixir)
-- - Stylua(Linter for Lua)
-- - Biome(Linter for Javascript and Typescript)
-- For more information, visit: https://github.com/nvimtools/none-ls.nvim/blob/main/doc/BUILTINS.md
return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")

		null_ls.setup({
			sources = {
				-- Lua
				null_ls.builtins.formatting.stylua,
				-- Javascript, Typescript
				null_ls.builtins.formatting.biome,
				-- Python
				null_ls.builtins.formatting.isort,
				null_ls.builtins.formatting.black,
				-- Elixir
				null_ls.builtins.diagnostics.credo,
			},
		})

		vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
	end,
}
