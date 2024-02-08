vim.o.background = "dark"

return {
  {
    "ellisonleao/gruvbox.nvim",
    name = "gruvbox",
    priority = 1000,
    config = function()
      require("gruvbox").setup({
        contrast = "soft",
      })
      local function toggle_background()
        if vim.o.background == "dark" then
          vim.o.background = "light"
        else
          vim.o.background = "dark"
        end
      end

      vim.cmd("colorscheme gruvbox")
      vim.keymap.set("n", "<leader>tb", toggle_background, {})
    end,
  },
}
