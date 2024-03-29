return {
  setup = function(lspconfig, on_attach, capabilities)
    lspconfig.astro.setup({
      on_attach = on_attach,
      capabilities = capabilities,
    })
  end,
}
