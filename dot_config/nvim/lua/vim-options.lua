-- Basics
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set cursorline")
vim.cmd("set number")
vim.cmd("set relativenumber")
vim.g.mapleader = " "

-- Background

-- I want jk to be esc
vim.keymap.set("i", "jk", "<esc>", { remap = true })

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

-- Remove highlights
vim.keymap.set("n", "<esc><esc>", ":noh<CR>", {})

-- Diagnostics
vim.keymap.set("n", "<leader>sd", ":lua vim.diagnostic.open_float()<CR>", {})
vim.keymap.set("n", "<leader>dd", ":Telescope diagnostics<CR>", {})
vim.keymap.set("n", "]h", ":lua vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.HINT })<CR>", {})
vim.keymap.set("n", "[h", ":lua vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.HINT })<CR>", {})
vim.keymap.set("n", "]i", ":lua vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.INFO })<CR>", {})
vim.keymap.set("n", "[i", ":lua vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.INFO })<CR>", {})
vim.keymap.set("n", "]w", ":lua vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.WARN })<CR>", {})
vim.keymap.set("n", "[w", ":lua vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.WARN })<CR>", {})
vim.keymap.set("n", "]e", ":lua vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.ERROR })<CR>", {})
vim.keymap.set("n", "[e", ":lua vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.ERROR })<CR>", {})
