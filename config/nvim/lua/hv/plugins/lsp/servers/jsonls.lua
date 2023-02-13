return {
  setup = function(lspconfig, on_attach, capabilities)
    lspconfig.jsonls.setup({
      on_attach = function(client, bufnr)
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentRangeFormattingProvider = false

        on_attach(client, bufnr)
      end,
      capabilities = capabilities,
      settings = {
        json = {
          schemas = require("schemastore").json.schemas(),
          validate = { enable = true },
        },
      },
    })
  end,
}
