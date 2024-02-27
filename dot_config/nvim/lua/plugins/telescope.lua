return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    dependencies = { "nvim-lua/plenary.nvim" },
    name = "telescope",
    config = function()
      local function get_git_dir()
        local git_dir = vim.fn.trim(vim.fn.system("git rev-parse --show-toplevel"))
        return git_dir
      end

      local builtin = require("telescope.builtin")

      vim.keymap.set("n", "<leader><leader>", builtin.find_files, {})
      vim.keymap.set("n", "<leader>/", builtin.live_grep, {})
      vim.keymap.set("n", "<leader>fw", builtin.grep_string, {})
      -- Show recent files in the current git directory
      vim.keymap.set("n", "<leader>fj", function()
        builtin.oldfiles({
          cwd = get_git_dir(),
        })
      end, {})
      vim.keymap.set("n", "<leader>bf", builtin.buffers, {})
    end,
  },
}
