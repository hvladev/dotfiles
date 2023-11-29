return {
  setup = function(lspconfig, on_attach, capabilities)
    lspconfig.ruby_ls.setup({
      on_attach = on_attach,
      capabilities = capabilities,
    })
  end,
}
