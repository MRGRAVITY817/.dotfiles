return {
	"akinsho/flutter-tools.nvim",
	lazy = false,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"stevearc/dressing.nvim", -- optional for vim.ui.select
	},
	config = function()
		require("flutter-tools").setup({
			widget_guides = {
				enabled = false,
			},
		})
		-- Show flutter commands from Telescope
		require("telescope").load_extension("flutter")
		-- Keymaps
		vim.keymap.set("n", "<leader>fc", require("telescope").extensions.flutter.commands, {})
	end,
}
