return {
  "folke/zen-mode.nvim",
  opts = {},
  config = function()
    require("zen-mode").setup({})

    vim.keymap.set("n", "<leader>zm", ":ZenMode<CR>", {})
  end,
}
