vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.g.mapleader = " "

vim.keymap.set('n', '<leader>ft', ":term<CR>i", {})

-- Panes
-- - Creating panes
vim.keymap.set('n', '<leader>|', "<C-w>v", {})
vim.keymap.set('n', '<leader>-', "<C-w>s", {})
-- - Navigation
for _, arrow_key in ipairs({"j", "k", "l", "h"}) do
  vim.keymap.set('n', string.format("<C-%s>", arrow_key), string.format("<C-w>%s", arrow_key), {})
end





