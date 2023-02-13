local null_ls = require("null-ls")

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions

return {
  setup = function(_lspconfig, on_attach, _capabilities)
    null_ls.setup({
      sources = {
        -- JavaScript
        formatting.prettierd,
        diagnostics.eslint_d,
        code_actions.eslint_d,

        -- Ruby
        formatting.standardrb,
        diagnostics.standardrb,
      },
      on_attach = on_attach,
    })
  end,
}
