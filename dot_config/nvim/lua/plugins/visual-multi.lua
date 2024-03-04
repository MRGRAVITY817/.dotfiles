return {
  "mg979/vim-visual-multi",
  config = function()
    vim.g.VM_maps = {
      ["Find Under"] = "<C-n>",
      ["Find Subword Under"] = "<C-n>",
      ["Find Next"] = "<C-n>",
      ["Find Prev"] = "<C-p>",
      ["Find Skip"] = "<C-x>",
      ["Find Prev Skip"] = "<C-X>",
    }
  end,
}
