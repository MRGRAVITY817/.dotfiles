vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.g.mapleader = " "

-- Creating panes
vim.keymap.set("n", "<leader>|", "<C-w>v", {})
vim.keymap.set("n", "<leader>-", "<C-w>s", {})

-- Navigating panes
for _, arrow_key in ipairs({ "j", "k", "l", "h" }) do
	vim.keymap.set("n", string.format("<C-%s>", arrow_key), string.format("<C-w>%s", arrow_key), {})
end

-- Open terminal in pane below
vim.keymap.set("n", "<leader>ft", ":split | wincmd j | term<CR>i", {})
vim.cmd("autocmd TermClose * exe 'bdelete! '..expand('<abuf>')")

-- Copy/Cut/Paste Clipboard
vim.cmd("set clipboard+=unnamedplus")

-- Auto format
vim.cmd("autocmd BufWritePre * lua vim.lsp.buf.format({ async = false })")
