vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.g.mapleader = " "

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  { 
    'nvim-telescope/telescope.nvim', 
    tag = '0.1.5',
    dependencies = { 'nvim-lua/plenary.nvim' },
    name = "telescope", 
  },
  {
    'nvim-treesitter/nvim-treesitter', build = ':TSUpdate'
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    }
}
}
local opts = {}

require("lazy").setup(plugins, opt)

require("catppuccin").setup()
vim.cmd.colorscheme "catppuccin"

local builtin = require("telescope.builtin")
vim.keymap.set('n', '<leader><leader>', builtin.find_files, {})

local treesitter_config = require('nvim-treesitter.configs')
treesitter_config.setup({
  ensure_installed = {"lua", "javascript", "rust", "clojure", "elixir", "heex"},
  highlight = { enable = true },
  indent = { enable = true },
})

vim.keymap.set('n', '<leader>fe', ':Neotree filesystem reveal left<CR>', {})
