vim.o.background = "dark"

return {
  "ellisonleao/gruvbox.nvim",
  name = "gruvbox",
  priority = 1000,
  config = function()
    require("gruvbox").setup({
      contrast = "soft"
    })
    vim.cmd("colorscheme gruvbox")
  end
}
