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
          "rust_analyzer",
          "clojure_lsp",
          "html",
          "htmx",
          "emmet_language_server",
          "tailwindcss",
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
      config.rust_analyzer.setup({
        capabilities = capabilities,
      })
      config.tsserver.setup({
        capabilities = capabilities,
      })
      config.fennel_language_server.setup({
        capabilities = capabilities,
      })
      config.html.setup({
        capabilities = capabilities,
        filetypes = { "html", "elixir", "eelixir", "heex" },
      })
      config.htmx.setup({
        capabilities = capabilities,
      })
      config.clojure_lsp.setup({
        capabilities = capabilities,
      })
      config.emmet_language_server.setup({
        capabilities = capabilities,
      })
      config.tailwindcss.setup({
        capabilities = capabilities,
      })

      -- keymaps
      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "gr", require("telescope.builtin").lsp_references, {})
      vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
      vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {})
      vim.keymap.set("n", "<leader>ff", vim.lsp.buf.format, {})

      -- add borders to LSP UI
      local _border = "single"

      vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
        border = _border,
      })

      vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
        border = _border,
      })

      vim.diagnostic.config({
        float = { border = _border },
      })

      require("lspconfig.ui.windows").default_options = {
        border = _border,
      }
    end,
  },
}
