return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      {
        "jose-elias-alvarez/null-ls.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
      },

      -- Neovim setup for init.lua
      "folke/neodev.nvim",

      -- JSON schemas for Neovim
      "b0o/schemastore.nvim",
    },
    config = function()
      local servers = {
        "astro",
        "clojure_lsp",
        "cssls",
        "emmet_ls",
        "html",
        "jsonls",
        "lua_ls",
        "solargraph",
        -- "steep",
        "svelte",
        "tailwindcss",
        "tsserver",
      }

      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = servers,
      })

      local lspconfig = require("lspconfig")

      local wk = require("which-key")

      local on_attach = function(_client, bufnr)
        wk.register({
          ["gd"] = { vim.lsp.buf.definition, "[LSP] Goto Definition" },
          ["gD"] = { vim.lsp.buf.declaration, "[LSP] Goto Declaration" },
          ["gi"] = { vim.lsp.buf.implementation, "[LSP] Goto Implementation" },
          ["gr"] = { vim.lsp.buf.references, "[LSP] References" },

          ["K"] = { vim.lsp.buf.hover, "[LSP] Hover" },
          ["S"] = { vim.lsp.buf.signature_help, "[LSP] Signature Help" },

          ["<leader>l"] = {
            ["a"] = { vim.lsp.buf.code_action, "[LSP] Open Code Actions Menu" },
            ["D"] = { vim.lsp.buf.type_definition, "[LSP] Show Type Definition" },
            ["r"] = { vim.lsp.buf.rename, "[LSP] Rename" },
            ["s"] = {
              require("telescope.builtin").lsp_document_symbols,
              "[LSP] Show Document Symbols",
            },
            ["f"] = {
              function()
                vim.lsp.buf.format({ async = true, timeout = 5000 })
              end,
              "[LSP] Format",
            },
          },

          ["<leader>d"] = {
            ["f"] = { vim.diagnostic.open_float, "[DGC] Open Float" },
            ["j"] = { vim.diagnostic.goto_next, "[DGC] Next Diagnostic" },
            ["k"] = { vim.diagnostic.goto_prev, "[DGC] Previous Diagnostic" },
            ["l"] = { vim.diagnostic.setloclist, "[DGC] Open Location List" },
          },
        }, {
          buffer = bufnr,
          mode = "n",
          prefix = "",
          silent = true,
          noremap = true,
          nowait = true,
        })
      end

      -- local capabilities = vim.lsp.protocol.make_client_capabilities()
      -- capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      capabilities.textDocument.completion.completionItem.snippetSupport = true

      for _, server in ipairs(servers) do
        require("hv.plugins.lsp.servers." .. server).setup(
          lspconfig,
          on_attach,
          capabilities
        )
      end
      require("hv.plugins.lsp.servers.null_ls").setup(
        lspconfig,
        on_attach,
        capabilities
      )

      vim.fn.sign_define("DiagnosticSignError", {
        text = "",
        texthl = "DiagnosticSignError",
        numhl = "",
      })
      vim.fn.sign_define("DiagnosticSignWarn", {
        text = "",
        texthl = "DiagnosticSignWarn",
        numhl = "",
      })
      vim.fn.sign_define("DiagnosticSignHint", {
        text = "",
        texthl = "DiagnosticSignHint",
        numhl = "",
      })
      vim.fn.sign_define("DiagnosticSignInfo", {
        text = "",
        texthl = "DiagnosticSignInfo",
        numhl = "",
      })

      vim.diagnostic.config({
        virtual_text = {
          source = "always",
          prefix = "▎",
          spacing = 6,
        },
        float = {
          source = "always",
        },
        signs = true,
        underline = true,
        update_in_insert = false,
        severity_sort = true,
      })
    end,
  },
}
