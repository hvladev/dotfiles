return {
  setup = function(lspconfig, on_attach, capabilities)
    lspconfig.html.setup({
      on_attach = function(client, bufnr)
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentRangeFormattingProvider = false

        on_attach(client, bufnr)
      end,
      capabilities = capabilities,
    })
  end,
}
