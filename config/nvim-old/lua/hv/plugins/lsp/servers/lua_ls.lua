return {
  setup = function(lspconfig, on_attach, capabilities)
    require("neodev").setup()

    lspconfig.lua_ls.setup({
      on_attach = on_attach,
      capabilities = capabilities,
    })
  end,
}