-- https://github.com/nvim-telescope/telescope.nvim

return {
  'nvim-telescope/telescope.nvim',
  branch = '0.1.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  },
  config = function()
    require('telescope').setup({
      defaults = {
        prompt_prefix = '     ',
        sorting_strategy = 'ascending',
        layout_config = {
          horizontal = {
            prompt_position = 'top',
          }
        },
        mappings = {
          i = {
            ['<C-j>'] = 'move_selection_next',
            ['<C-k>'] = 'move_selection_previous',
          },
          n = {
            ['<C-j>'] = 'move_selection_next',
            ['<C-k>'] = 'move_selection_previous',
          },
        },
      },
      pickers = {
        buffers = {
          mappings = {
            i = {
              ['<C-S-D>'] = 'delete_buffer',
            },
          },
        },
      }
    })

    require('telescope').load_extension('fzf')

    local TelescopePrompt = {
      TelescopePromptNormal = {
        bg = '#31353f',
      },
      TelescopePromptBorder = {
        fg = '#31353f',
        bg = '#31353f',
      },
      TelescopePromptTitle = {
        fg = '#181a1f',
        bg = '#73b8f1',
      },

      TelescopeResultsNormal = {
        bg = '#21252b',
      },
      TelescopeResultsBorder = {
        fg = '#21252b',
        bg = '#21252b',
      },
      TelescopeResultsTitle = {
        fg = '#21252b',
        bg = '#21252b',
      },
      TelescopeSelection = {
        bg = '#31353f',
      },
      TelescopeSelectionCaret = {
        fg = '#73b8f1',
      },

      TelescopePreviewNormal = {
        bg = '#181a1f',
      },
      TelescopePreviewBorder = {
        fg = '#181a1f',
        bg = '#181a1f',
      },
      TelescopePreviewTitle = {
        fg = '#181a1f',
        bg = '#181a1f',
      },
    }
    for hl, col in pairs(TelescopePrompt) do
      vim.api.nvim_set_hl(0, hl, col)
    end

    -- [[ Mappings ]]
    local b = require('telescope.builtin')
    local map = vim.keymap.set
    map('n', '<leader>j', b.find_files, { desc = '[j] Search files' })
    map('n', '<leader>k', b.buffers, { desc = '[k] Search existing buffers' })
    map('n', '<leader>sm', b.marks, { desc = '[S]earch [M]arks' })
    map('n', '<leader>sw', b.grep_string, { desc = '[S]earch current [W]ord' })
    map('n', '<leader>sg', b.live_grep, { desc = '[S]earch by [G]rep' })
    map('n', '<leader>/', function()
      b.current_buffer_fuzzy_find({ previewer = false })
    end, { desc = '[/] Fuzzily search in current buffer' })
    map('n', '<leader>sG', b.git_files, { desc = '[S]earch [G]it files' })
    map('n', '<leader>sh', b.help_tags, { desc = '[S]earch [H]elp' })
    map('n', '<leader>sd', b.diagnostics, { desc = '[S]earch [D]iagnostics' })
    map('n', '<leader>s:', b.command_history, { desc = '[:] Search command history' })
    map('n', '<leader>s/', b.search_history, { desc = '[/] Search search history' })
    map('n', '<leader>sr', b.registers, { desc = '[S]earch [r]egisters' })
    map('n', '<leader>sR', b.resume, { desc = '[S]earch [R]esume' })
    map('n', '<leader>si', b.builtin, { desc = '[S]earch built-[I]n pickers' })
  end
}
