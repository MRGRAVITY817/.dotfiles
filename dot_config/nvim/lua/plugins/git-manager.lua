return {
	"NeogitOrg/neogit",
	dependencies = {
		"nvim-lua/plenary.nvim", -- required
		"sindrets/diffview.nvim", -- optional - Diff integration

		-- Only one of these is needed, not both.
		"nvim-telescope/telescope.nvim", -- optional
		"ibhagwan/fzf-lua", -- optional
	},
	config = function()
		local neogit = require("neogit")

		-- setup
		neogit.setup({
			kind = "vsplit",
			commit_editor = {
				kind = "vsplit",
			},
		})

		-- keymaps
		vim.keymap.set("n", "<leader>ng", function()
			neogit.open()
		end, {})
	end,
}
