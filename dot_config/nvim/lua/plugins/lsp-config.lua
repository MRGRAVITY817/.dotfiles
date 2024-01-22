return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
      -- keymaps
      vim.keymap.set("n", "<leader>cm", ":Mason<CR>", {})
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "tsserver",
          "fennel_language_server",
          "clojure_lsp",
        },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    name = "lsconfig",
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      local config = require("lspconfig")
      config.lua_ls.setup({
        capabilities = capabilities,
      })
      config.tsserver.setup({
        capabilities = capabilities,
      })
      config.fennel_language_server.setup({
        capabilities = capabilities,
      })
      config.clojure_lsp.setup({
        capabilities = capabilities,
      })
      -- keymaps
      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "gr", vim.lsp.buf.references, {})
      vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
      vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {})
      vim.keymap.set("n", "<leader>ff", vim.lsp.buf.format, {})
    end,
  },
}
