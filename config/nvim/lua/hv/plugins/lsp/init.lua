-- https://github.com/neovim/nvim-lspconfig
-- https://github.com/williamboman/mason.nvim
-- https://github.com/williamboman/mason-lspconfig.nvim

return {
  'neovim/nvim-lspconfig',
  dependencies = {
    -- Automatically install LSPs to stdpath for neovim
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',

    -- Additional lua configuration, makes nvim stuff amazing!
    'folke/neodev.nvim',

    -- JSON schemas for Neovim
    'b0o/schemastore.nvim',
  },
  config = function()
    local servers = {
      'astro',
      'jsonls',
      'lua_ls',
      'ruby_ls',
      'standardrb',
      'tailwindcss',
      'tsserver',
    }

    -- Set up additional completion capabilities (nvim-cmp)
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

    local lspconfig = require('lspconfig')
    local on_attach = require('hv.plugins.lsp.on_attach')

    require('mason').setup()
    require('mason-lspconfig').setup({
      ensure_installed = servers,
      handlers = {
        function(server_name)
          require("hv.plugins.lsp.servers." .. server_name).setup(
            lspconfig,
            on_attach,
            capabilities
          )
        end,
      },
    })
  end,
}
