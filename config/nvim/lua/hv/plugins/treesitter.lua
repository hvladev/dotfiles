-- https://github.com/nvim-treesitter/nvim-treesitter

return {
  'nvim-treesitter/nvim-treesitter',
  dependencies = {
    'nvim-treesitter/nvim-treesitter-textobjects',
  },
  build = ':TSUpdate',
  config = function()
    vim.defer_fn(function()
      require('nvim-treesitter.configs').setup({
        -- Put this to please an error message about required field
        modules = {},

        -- Add languages to be installed here that you want installed for treesitter
        ensure_installed = {
          'astro',
          'bash',
          'c',
          'cpp',
          'javascript',
          'lua',
          'python',
          'ruby',
          'tsx',
          'typescript',
          'vim',
          'vimdoc',
        },

        -- Install parsers synchronously (only applied to `ensure_installed`)
        sync_install = false,

        -- Automatically install missing parsers when entering buffer
        auto_install = false,

        -- List of parsers to ignore installing (or "all")
        ignore_install = {},

        highlight = { enable = true },
        indent = { enable = true },
        incremental_selection = {
          enable = false,
          -- keymaps = {
          --   init_selection = '<c-space>',
          --   node_incremental = '<c-space>',
          --   scope_incremental = '<c-s>',
          --   node_decremental = '<M-space>',
          -- },
        },
        textobjects = {
          select = {
            enable = true,
            lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
            keymaps = {
              -- You can use the capture groups defined in textobjects.scm
              ['aa'] = '@parameter.outer',
              ['ia'] = '@parameter.inner',
              ['af'] = '@function.outer',
              ['if'] = '@function.inner',
              ['ac'] = '@class.outer',
              ['ic'] = '@class.inner',
            },
          },
          move = {
            enable = true,
            set_jumps = true, -- whether to set jumps in the jumplist
            goto_next_start = {
              [']m'] = '@function.outer',
              [']]'] = '@class.outer',
            },
            goto_next_end = {
              [']M'] = '@function.outer',
              [']['] = '@class.outer',
            },
            goto_previous_start = {
              ['[m'] = '@function.outer',
              ['[['] = '@class.outer',
            },
            goto_previous_end = {
              ['[M'] = '@function.outer',
              ['[]'] = '@class.outer',
            },
          },
          swap = {
            enable = true,
            swap_next = {
              ['<leader>a'] = '@parameter.inner',
            },
            swap_previous = {
              ['<leader>A'] = '@parameter.inner',
            },
          },
        },

        matchup = {
          enable = true,
        },
      })
    end, 0)
  end,
}
