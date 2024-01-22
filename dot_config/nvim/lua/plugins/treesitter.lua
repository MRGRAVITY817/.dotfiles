return {
  'nvim-treesitter/nvim-treesitter', build = ':TSUpdate',
  config = function()
    local config = require('nvim-treesitter.configs')
    config.setup({
      ensure_installed = {
        "lua", "javascript", "typescript", "tsx",
        "rust", "toml", "yaml", "json",
        "elixir", "heex", "eex", "markdown",
        "fennel", "clojure", "scheme", "racket",
      },
      highlight = { enable = true },
      indent = { enable = true },
    })
  end
}

