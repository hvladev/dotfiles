-- https://github.com/neovim/nvim-lspconfig

return {
  "neovim/nvim-lspconfig",
  dependencies = {
    -- Additional lua configuration, makes nvim stuff amazing!
    "folke/neodev.nvim",

    -- JSON schemas for Neovim
    "b0o/schemastore.nvim",
  },
  config = function()
    local lspconfig = require("lspconfig")
    local servers = {
      "astro",
      "clojure_lsp",
      "cssls",
      "elixirls",
      "eslint",
      "html",
      "jsonls",
      "lua_ls",
      "ruby_lsp",
      "standardrb",
      "tailwindcss",
      "ts_ls",
    }

    -- Set up additional completion capabilities (nvim-cmp)
    local default_capabilities = vim.lsp.protocol.make_client_capabilities()
    local capabilities = vim.tbl_deep_extend(
      "force",
      default_capabilities,
      require("cmp_nvim_lsp").default_capabilities()
    )

    local on_attach = require("hv.plugins.lsp.on_attach")

    for _, server_name in ipairs(servers) do
      require("hv.plugins.lsp.servers." .. server_name).setup(
        lspconfig,
        on_attach,
        capabilities
      )
    end
  end,
}
