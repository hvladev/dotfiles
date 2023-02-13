return {
  setup = function(lspconfig, on_attach, capabilities)
    lspconfig.tailwindcss.setup({
      on_attach = on_attach,
      capabilities = capabilities,
      settings = {
        tailwindCSS = {
          experimental = {
            classRegex = {
              "\\bclass:\\s*'([^']*)'",
              "\\bclass:\\s*\"([^\"]*)\"",
            },
          },
        },
      },
    })
  end,
}
