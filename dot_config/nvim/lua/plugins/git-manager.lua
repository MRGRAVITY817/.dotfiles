return {
	"NeogitOrg/neogit",
	dependencies = {
		"nvim-lua/plenary.nvim", -- required
		"sindrets/diffview.nvim", -- optional
		"nvim-telescope/telescope.nvim", -- optional
	},
	config = function()
		local neogit = require("neogit")

		-- setup
		neogit.setup({})

		-- keymaps
		vim.keymap.set("n", "<leader>ng", function()
			neogit.open()
		end, {})
	end,
}
