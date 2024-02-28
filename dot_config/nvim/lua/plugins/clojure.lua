return {
  -- { "liquidz/vim-iced" },
  {
    "Olical/conjure",
    ft = { "clojure", "fennel", "python", "scheme", "hy" }, -- etc
    -- [Optional] cmp-conjure for cmp
    dependencies = {
      {
        "PaterJason/cmp-conjure",
        config = function()
          local cmp = require("cmp")
          local config = cmp.get_config()
          table.insert(config.sources, {
            name = "buffer",
            option = {
              sources = {
                { name = "conjure" },
              },
            },
          })
          cmp.setup(config)
        end,
      },
    },
    config = function(_, opts)
      require("conjure.main").main()
      require("conjure.mapping")["on-filetype"]()
      require("lspconfig").clojure_lsp.setup({
        filetypes = { "clojure", "edn", "cljd" },
      })
    end,
    init = function()
      -- Set configuration options here
      vim.g["conjure#debug"] = true
      -- Rebind it from K to <prefix>gk
      vim.g["conjure#mapping#doc_word"] = "gk"
      -- Local leader should be "Space"
      vim.g.maplocalleader = " "
    end,
  },
  { "tpope/vim-repeat" },
  {
    "julienvincent/nvim-paredit",
    config = function()
      require("nvim-paredit").setup()
    end,
  },
}
