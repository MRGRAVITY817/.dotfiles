vim.g.mapleader = " "

-- Basics
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set cursorline")
vim.cmd("set number")
vim.cmd("set relativenumber")

-- Background

-- I want jk to be esc
vim.keymap.set("i", "jk", "<esc>", { remap = true })

-- Pane splitting direction
vim.o.splitright = true
vim.o.splitbelow = true

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

-- To use ALT+{h,j,k,l} to navigate windows from any mode:
vim.keymap.set("t", "<A-h>", "<C-\\><C-N><C-w>h", {})
vim.keymap.set("t", "<A-j>", "<C-\\><C-N><C-w>j", {})
vim.keymap.set("t", "<A-k>", "<C-\\><C-N><C-w>k", {})
vim.keymap.set("t", "<A-l>", "<C-\\><C-N><C-w>l", {})
vim.keymap.set("i", "<A-h>", "<C-\\><C-N><C-w>h", {})
vim.keymap.set("i", "<A-j>", "<C-\\><C-N><C-w>j", {})
vim.keymap.set("i", "<A-k>", "<C-\\><C-N><C-w>k", {})
vim.keymap.set("i", "<A-l>", "<C-\\><C-N><C-w>l", {})
vim.keymap.set("n", "<A-h>", "<C-w>h", {})
vim.keymap.set("n", "<A-j>", "<C-w>j", {})
vim.keymap.set("n", "<A-k>", "<C-w>k", {})
vim.keymap.set("n", "<A-l>", "<C-w>l", {})

-- Copy/Cut/Paste Clipboard
vim.cmd("set clipboard+=unnamedplus")

-- Remove highlights
vim.keymap.set("n", "<leader>hq", ":noh<CR>", {})

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
