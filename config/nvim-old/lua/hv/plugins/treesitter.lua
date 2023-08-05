return {
  "nvim-treesitter/nvim-treesitter",
  build = function()
    require("nvim-treesitter.install").update({ with_sync = true })
  end,
  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects",
    "RRethy/nvim-treesitter-endwise",
    {
      "andymass/vim-matchup",
      config = function()
        vim.g.matchup_matchparen_offscreen = {}
      end,
    },
    "JoosepAlviste/nvim-ts-context-commentstring",
    { "nvim-treesitter/playground", cmd = "TSPlaygroundToggle" }
  },
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        "astro",
        "bash",
        "c",
        "clojure",
        "cmake",
        "comment",
        "cpp",
        "css",
        "diff",
        "dockerfile",
        "embedded_template",
        "fish",
        "git_rebase",
        "gitattributes",
        "gitcommit",
        "gitignore",
        "graphql",
        "html",
        "http",
        "javascript",
        "jsdoc",
        "json",
        "json5",
        "jsonc",
        "lua",
        "make",
        "markdown",
        "markdown_inline",
        "php",
        "python",
        "racket",
        "ruby",
        "sql",
        "svelte",
        "toml",
        "tsx",
        "typescript",
        "vim",
        "yaml",
      },
      ignore_install = { "phpdoc" },
      sync_install = true,

      highlight = {
        enable = true,
        disable = { "embedded_template" },
      },

      indent = {
        enable = true,
      },

      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-s>",
          node_incremental = "<C-s>",
          scope_incremental = "<C-S>",
          node_decremental = "<C-backspace>",
        },
      },

      textobjects = {
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            ["ac"] = "@class.outer",
            ["ic"] = "@class.inner",
            ["ar"] = "@block.outer",
            ["ir"] = "@block.inner",
            -- ["ap"] = "@parameter.outer",
            -- ["ip"] = "@parameter.inner",
          },
        },

        swap = {
          enable = true,
          swap_next = {
            ["<leader>a"] = "@parameter.inner",
          },
          swap_previous = {
            ["<leader>A"] = "@parameter.inner",
          },
        },

        move = {
          enable = true,
          set_jumps = true,
          goto_next_start = {
            ["]m"] = "@function.outer",
            ["]]"] = "@class.outer",
          },
          goto_next_end = {
            ["]M"] = "@function.outer",
            ["]["] = "@class.outer",
          },
          goto_previous_start = {
            ["[m"] = "@function.outer",
            ["[["] = "@class.outer",
          },
          goto_previous_end = {
            ["[M"] = "@function.outer",
            ["[]"] = "@class.outer",
          },
        },
      },

      matchup = {
        enable = true,
        matchparen_offscreen = { method = "popup" },
      },

      endwise = {
        enable = true
      },

      context_commentstring = {
        enable = true,
        enable_autocmd = false,
      },
    })
  end,
}
