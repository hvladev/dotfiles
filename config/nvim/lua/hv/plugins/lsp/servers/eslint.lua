return {
  setup = function(lspconfig, on_attach, capabilities)
    lspconfig.eslint.setup({
      on_attach = on_attach,
      capabilities = capabilities,
      settings = {
        format = false,
      },
    })
  end,
}
