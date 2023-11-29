return {
  setup = function(lspconfig, on_attach, capabilities)
    lspconfig.standardrb.setup({
      on_attach = on_attach,
      capabilities = capabilities,
    })
  end,
}
