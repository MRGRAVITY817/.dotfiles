return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
			-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
		},
		config = function()
			vim.keymap.set("n", "<leader>fe", function()
				local reveal_file = vim.fn.expand("%:p")
				if reveal_file == "" then
					reveal_file = vim.fn.getcwd()
				else
					local f = io.open(reveal_file, "r")
					if f then
						f.close(f)
					else
						reveal_file = vim.fn.getcwd()
					end
				end
				require("neo-tree.command").execute({
					action = "focus", -- OPTIONAL, this is the default value
					source = "filesystem", -- OPTIONAL, this is the default value
					position = "left", -- OPTIONAL, this is the default value
					reveal_file = reveal_file, -- path to file or folder to reveal
					reveal_force_cwd = true, -- change cwd without asking if needed
				})
			end, { desc = "Open neo-tree at current file or working directory" })

			require("neo-tree").setup({
				filesystem = {
					follow_current_file = {
						enabled = true,
						leave_dirs_open = false,
					},
					use_libuv_file_watcher = true,
					filtered_items = {
						hide_dotfiles = false,
						hide_gitignored = true,
					},
				},
			})
		end,
	},
	{
		"stevearc/oil.nvim",
		opts = {},
		-- Optional dependencies
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("oil").setup()
			vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
		end,
	},
}
