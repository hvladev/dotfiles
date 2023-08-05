local null_ls = require("null-ls")

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions

return {
  setup = function(_lspconfig, on_attach, _capabilities)
    null_ls.setup({
      sources = {
        -- JavaScript
        formatting.prettierd.with({
          extra_filetypes = {
            "astro",
          },
        }),
        diagnostics.eslint_d,
        code_actions.eslint_d,

        -- Ruby
        formatting.standardrb,
        diagnostics.standardrb,

        -- ERB
        formatting.erb_format, -- https://github.com/nebulab/erb-formatter
      },
      on_attach = on_attach,
    })
  end,
}
