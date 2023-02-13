return {
  setup = function(lspconfig, on_attach, capabilities)
    lspconfig.clojure_lsp.setup({
      on_attach = on_attach,
      capabilities = capabilities,
    })
  end,
}
