return {
  {
    "mhinz/vim-signify",
    config = function()
      vim.g.signify_sign_add = "+"
      vim.g.signify_sign_add_first_line = "+"
      vim.g.signify_sign_change = "~"
      vim.g.signify_sign_delete = "-"
      vim.g.signify_sign_delete_first_line = "-"
    end,
  },
  {
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
  },
}
