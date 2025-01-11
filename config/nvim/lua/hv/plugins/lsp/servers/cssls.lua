return {
  setup = function(lspconfig, on_attach, capabilities)
    lspconfig.cssls.setup({
      on_attach = on_attach,
      capabilities = capabilities,
    })
  end,
}
