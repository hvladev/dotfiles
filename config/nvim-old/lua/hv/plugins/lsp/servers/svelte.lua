return {
  setup = function(lspconfig, on_attach, capabilities)
    lspconfig.svelte.setup({
      on_attach = on_attach,
      capabilities = capabilities,
    })
  end,
}
