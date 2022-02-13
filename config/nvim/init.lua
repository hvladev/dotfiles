--------------------------------------------------------------------------------
--| TABLE OF CONTENTS
--------------------------------------------------------------------------------
--|
--| Options                  load_options
--|
--| Keymaps                  load_keymaps
--|
--| Plugin configurations    config_lsp
--|                          config_null_ls
--|                          config_treesitter
--|                          config_devicons
--|                          config_lualine
--|                          config_bufferline
--|                          config_which_key
--|                          config_nvim_tree
--|                          config_telescope
--|                          config_comment
--|                          config_autopairs
--|                          config_indent_blankline
--|                          config_gitsigns
--|                          config_cmp
--|
--| Plugin manager           load_plugins
--|
--| Commands                 insert_timestamp
--|                          set_advent_of_code_mappings
--|                          load_commands
--|
--| Misc                     highlight_on_yank
--|                          load_misc
--|
--| Init                     load_config
--|
--------------------------------------------------------------------------------




--------------------------------------------------------------------------------
--|=============================================================================
--|
--| OPTIONS
--|
--|=============================================================================
--------------------------------------------------------------------------------

local function load_options()
  local opt = vim.opt

  -- [[ UI ]]
  opt.cmdheight = 1
  opt.colorcolumn = "80"
  opt.completeopt = "menuone,noselect"
  opt.cursorline = true
  opt.number = true
  opt.pumheight = 10
  opt.relativenumber = true
  opt.scrolloff = 4
  opt.showmode = false
  opt.showtabline = 2
  opt.signcolumn = "yes"
  opt.syntax = "ON"
  opt.termguicolors = true

  -- [[ Search ]]
  opt.hlsearch = true
  opt.ignorecase = true
  opt.incsearch = true
  opt.smartcase = true

  -- [[ Whitespace ]]
  opt.expandtab = true
  opt.shiftwidth = 2
  opt.softtabstop = 2
  opt.tabstop = 2

  -- [[ Splits ]]
  opt.splitbelow = true
  opt.splitright = true

  -- [[ Undo ]]
  opt.undofile = true
  opt.undolevels = 3000
  opt.undoreload = 10000

  -- [[ Misc ]]
  opt.clipboard = "unnamedplus"
  opt.linebreak = true
  opt.mouse = "a"
  opt.smartindent = true
  opt.spelllang = "en_us"
  opt.timeoutlen = 500
end

--------------------------------------------------------------------------------
--|=============================================================================
--|
--| KEYMAPS
--|
--|=============================================================================
--------------------------------------------------------------------------------

local function load_keymaps()
  -- Common options
  local opts = { silent = true }
  local term_opts = { silent = true }

  -- Shorter function name to define mappings
  local keymap = vim.keymap.set

  -- Set leader
  keymap({ "n", "v" }, "<Space>", "<Nop>", opts)
  vim.g.mapleader = " "
  vim.g.maplocalleader = " "

  -- Modes:
  -- (String value | Help page | Affected modes | Vimscript equivalent)
  -- ""     mapmode-nvo    Normal, Visual, Select, Operator-pending    :map
  -- "n"    mapmode-n      Normal                                      :nmap
  -- "v"    mapmode-v      Visual and Select                           :vmap
  -- "s"    mapmode-s      Select                                      :smap
  -- "x"    mapmode-x      Visual                                      :xmap
  -- "o"    mapmode-o      Operator-pending                            :omap
  -- "!"    mapmode-ic     Insert and Command-line                     :map!
  -- "i"    mapmode-i      Insert                                      :imap
  -- "l"    mapmode-l      Insert, Command-line, Lang-Arg              :lmap
  -- "c"    mapmode-c      Command-line                                :cmap
  -- "t"    mapmode-t      Terminal                                    :tmap

  -- Escaping
  keymap("i", "jk", "<Esc>", opts)
  keymap("c", "jk", "<C-c>", opts)

  -- Use j and k to navigate between wrapped lines too
  keymap("v", "j", "gj", opts)
  keymap("v", "k", "gk", opts)
  keymap("n", "j", "gj", opts)
  keymap("n", "k", "gk", opts)

  -- Easier way to reach beginning/end of line
  keymap("n", "H", "^", opts)
  keymap("n", "L", "$", opts)
  keymap("x", "H", "^", opts)
  keymap("x", "L", "$", opts)

  -- Moving lines
  keymap("x", "<C-j>", ":move'>+<CR>gv", opts)
  keymap("x", "<C-k>", ":move-2<CR>gv", opts)
  keymap("x", "<C-h>", "<gv", opts)
  keymap("x", "<C-l>", ">gv", opts)

  -- Fast window navigation
  keymap("n", "<C-h>", "<C-w>h", opts)
  keymap("n", "<C-j>", "<C-w>j", opts)
  keymap("n", "<C-k>", "<C-w>k", opts)
  keymap("n", "<C-l>", "<C-w>l", opts)
  keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
  keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
  keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
  keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

  -- Resize window with arrows
  keymap("n", "<A-Up>", ":resize +2<CR>", opts)
  keymap("n", "<A-Down>", ":resize -2<CR>", opts)
  keymap("n", "<A-Left>", ":vertical resize -2<CR>", opts)
  keymap("n", "<A-Right>", ":vertical resize +2<CR>", opts)

  -- Make Y behave like other capitals
  keymap("n", "Y", "y$", opts)

  require("which-key").register({
    q = { "<cmd>quit<cr>", "Quit window" },
    m = { "<C-z>", "Suspend editor" },
    s = { "<cmd>update<cr>", "Save file" },
    c = { "<cmd>nohlsearch<cr>", "Clear search highlights" },
    ["<tab>"] = { "<C-^>", "Switch to alternate buffer" },

    ["|"] = { "<cmd>vsplit<cr>", "Split right" },
    ["-"] = { "<cmd>split<cr>", "Split below" },

    ["0"] = { "<cmd>:tablast<cr>", "Go to last tab" },
    ["1"] = { "1gt", "Go to tab 1" },
    ["2"] = { "2gt", "Go to tab 2" },
    ["3"] = { "3gt", "Go to tab 3" },
    ["4"] = { "4gt", "Go to tab 4" },
    ["5"] = { "5gt", "Go to tab 5" },
    ["6"] = { "6gt", "Go to tab 6" },
    ["7"] = { "7gt", "Go to tab 7" },
    ["8"] = { "8gt", "Go to tab 8" },
    ["9"] = { "9gt", "Go to tab 9" },

    ["]"] = { "gt", "Go to next tab" },
    ["["] = { "gT", "Go to previous tab" },

    ["}"] = { "<cmd>tabmove+<cr>", "Move tab to the right" },
    ["{"] = { "<cmd>tabmove-<cr>", "Move tab to the left" },

    [","] = {
      name = "[ SYSTEM ]",

      r = { "<cmd>source $MYVIMRC<cr>", "Reload config" },
      [","] = { "<cmd>tabnew $MYVIMRC<cr>", "Open config" },

      p = {
        name = "[ PLUGINS ]",

        s = { "<cmd>PackerStatus<cr>", "Status" },
        u = { "<cmd>PackerSync<cr>", "Sync" },
        c = { "<cmd>PackerCompile<cr>", "Compile" },
      },
    }
  }, { prefix = "<leader>", mode = "n" })
end

--------------------------------------------------------------------------------
--|=============================================================================
--|
--| PLUGIN CONFIGURATIONS
--|
--|=============================================================================
--------------------------------------------------------------------------------

local function config_lsp()
  require("nvim-lsp-installer").setup({
    automatic_installation = true,
  })

  local lspconfig = require("lspconfig")

  local on_attach = function(client, bufnr)
    if client.name == "tsserver" or client.name == "solargraph" then
      client.server_capabilities.documentFormattingProvider = false
    end

    local opts = { buffer = bufnr }

    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)

    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "S", vim.lsp.buf.signature_help, opts)

    require("which-key").register({
      name = "[ LSP ]",

      a = { vim.lsp.buf.code_action, "Code action", buffer = bufnr },
      d = { vim.lsp.buf.type_definition, "Type definition", buffer = bufnr },
      r = { vim.lsp.buf.rename, "Rename", buffer = bufnr },
      f = { vim.lsp.buf.format, "Format", buffer = bufnr },
      s = {
        require("telescope.builtin").lsp_document_symbols,
        "Symbols",
        buffer = bufnr,
      },

      w = {
        name = "[ WORKSPACE FOLDERS ]",
        a = {
          vim.lsp.buf.add_workspace_folder,
          "Add workspace folder",
          buffer = bufnr,
        },
        r = {
          vim.lsp.buf.remove_workspace_folder,
          "Remove workspace folder",
          buffer = bufnr,
        },
        l = {
          function() vim.inspect(vim.lsp.buf.list_workspace_folders()) end,
          "List workspace folders",
          buffer = bufnr,
        },
      },
    }, { prefix = "<leader>l", mode = "n" })
  end

  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

  local servers = {
    clojure_lsp = {},
    html = {},
    jsonls = {},
    cssls = {},
    tailwindcss = {
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
    },
    tsserver = {},
    svelte = {},
    solargraph = {
      settings = {
        solargraph = {
          diagnostics = false,
        },
      },
    },
    sumneko_lua = {
      settings = {
        Lua = {
          runtime = {
            version = "LuaJIT",
            path = (function()
              local runtime_path = vim.split(package.path, ";")

              table.insert(runtime_path, "lua/?.lua")
              table.insert(runtime_path, "lua/?/init.lua")

              return runtime_path
            end)(),
          },
          diagnostics = {
            globals = { "vim" },
          },
          workspace = {
            library = vim.api.nvim_get_runtime_file("", true),
          },
          telemetry = {
            enable = false,
          },
        },
      },
    },
  }

  for server_name, custom_config in pairs(servers) do
    local config = {
      capabilities = capabilities,
      on_attach = on_attach,
    }

    if custom_config.settings then
      config.settings = custom_config.settings
    end

    lspconfig[server_name].setup(config)
  end
end

local function config_null_ls()
  local null_ls = require("null-ls")

  null_ls.setup({
    sources = {
      null_ls.builtins.formatting.prettierd.with({
        extra_filetypes = { "liquid", "svelte" },
      }),

      null_ls.builtins.diagnostics.eslint_d,
      null_ls.builtins.code_actions.eslint_d,

      null_ls.builtins.diagnostics.standardrb,
      null_ls.builtins.formatting.standardrb,
    },
  })
end

local function config_treesitter()
  require("nvim-treesitter.configs").setup({
    ensure_installed = "all",
    ignore_install = { "phpdoc" },

    highlight = {
      enable = true,
    },

    indent = {
      enable = true,
    },

    incremental_selection = {
      enable = true,

      keymaps = {
        init_selection = "gnn",
        node_incremental = "grn",
        scope_incremental = "grc",
        node_decremental = "grm",
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
    },
  })
end

local function config_devicons()
  require("nvim-web-devicons").setup({
    override = {
      rb = {
        icon = "",
        color = "#e86671",
        name = "Rb",
      },
    },
  })
end

local function config_lualine()
  local colors = {
    blue   = "#61afef",
    green  = "#98c379",
    purple = "#c678dd",
    cyan   = "#56b6c2",
    red1   = "#e06c75",
    red2   = "#be5046",
    yellow = "#e5c07b",
    fg     = "#abb2bf",
    bg     = "#181a1f",
    gray1  = "#828997",
    gray2  = "#2c323c",
    gray3  = "#3e4452",
  }

  local onedark_hv = {
    normal = {
      a = { fg = colors.fg, bg = colors.bg },
      b = { fg = colors.fg, bg = colors.bg },
      c = { fg = colors.fg, bg = colors.bg },

      x = { fg = colors.fg, bg = colors.bg },
      y = { fg = colors.fg, bg = colors.bg },
      z = { fg = colors.fg, bg = colors.bg },
    },
    inactive = {
      a = { fg = colors.gray1, bg = colors.bg },
      b = { fg = colors.gray1, bg = colors.bg },
      c = { fg = colors.gray1, bg = colors.bg },
    },
  }

  require("lualine").setup({
    options = {
      icons_enabled = true,
      theme = onedark_hv,
      component_separators = { left = nil, right = nil },
      section_separators = { left = "·", right = "·" },
      disabled_filetypes = {},
      always_divide_middle = false,
      globalstatus = false,
    },
    sections = {
      lualine_a = { "filename" },
      lualine_b = {},
      lualine_c = {},
      lualine_x = {
        { "fileformat", symbols = { unix = "LF", dos = "CRLF", mac = "CR" } },
        "encoding",
        "filetype",
        "%l:%c"
      },
      lualine_y = {},
      lualine_z = {}
    },
    inactive_sections = {
      lualine_a = { "filename" },
      lualine_b = {},
      lualine_c = {},
      lualine_x = {},
      lualine_y = {},
      lualine_z = {}
    },
    tabline = {},
    extensions = { "nvim-tree" }
  })
end

local function config_bufferline()
  require("bufferline").setup({
    options = {
      mode = "tabs",
    }
  })
end

local function config_which_key()
  require("which-key").setup({
    plugins = {
      spelling = {
        enabled = true,
      },
    },
    window = {
      border = "none", -- none, single, double, shadow
      position = "bottom", -- bottom, top
      margin = { 0, 0, 0, 0 }, -- extra window margin [top, right, bottom, left]
      padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
      winblend = 0
    },
    layout = {
      align = "center",
    },
    icons = {
      group = "",
    },
    ignore_missing = true,
  })
end

local function config_nvim_tree()
  require("nvim-tree").setup({
    hijack_cursor = true,
    view = {
      hide_root_folder = true,
      side = "left",
      mappings = {
        custom_only = false,
        list = {
          { key = { "<CR>", "o", "l" }, action = "edit" },
        },
      },
    },
    renderer = {
      indent_markers = {
        enable = true,
      },
    },
    filters = {
      dotfiles = false,
      custom = { "node_modules", "\\.cache" },
    },
    actions = {
      open_file = {
        resize_window = true,
      },
    },
  })

  require("which-key").register({
    e = { "<cmd>NvimTreeFindFileToggle<cr>", "Toggle file explorer (file)" },
    E = { "<cmd>NvimTreeToggle<cr>", "Toggle file explorer (root)" },
  }, { prefix = "<leader>", mode = "n" })
end

local function config_telescope()
  local telescope = require("telescope")

  telescope.setup({
    defaults = {
      sorting_strategy = "ascending",
      layout_config = {
        prompt_position = "top",
      },
      mappings = {
        i = {
          ["<C-j>"] = "move_selection_next",
          ["<C-k>"] = "move_selection_previous",
        },
      },
    },
  })

  telescope.load_extension("fzf")

  local builtin = require("telescope.builtin")

  require("which-key").register({
    j = { builtin.find_files, "Find files" },
    k = { builtin.buffers, "Find buffers" },
    ["/"] = { builtin.live_grep, "Find text" },
    ["?"] = { builtin.grep_string, "Find text under cursor" },
  }, { prefix = "<leader>", mode = "n" })
end

local function config_comment()
  require("Comment").setup()
end

local function config_autopairs()
  require("nvim-autopairs").setup({})
end

local function config_indent_blankline()
  -- gray1 = "#828997"
  -- gray2 = "#2c323c"
  -- gray3 = "#3e4452"
  vim.cmd("highlight IndentBlanklineChar guifg=#3e4452 gui=nocombine")

  require("indent_blankline").setup({
    char = "┊", -- |, ¦, ┆, ┊
    show_trailing_blankline_indent = false,
  })
end

local function config_gitsigns()
  require("gitsigns").setup({
    signs = {
      add = { text = "+" },
      change = { text = "~" },
      delete = { text = "_" },
      topdelete = { text = "‾" },
      changedelete = { text = "~" },
    },
  })
end

local function config_cmp()
  local cmp = require("cmp")

  require("luasnip.loaders.from_vscode").lazy_load()
  local luasnip = require("luasnip")
  luasnip.filetype_extend("ruby", { "rails" })
  luasnip.filetype_extend("javascriptreact", { "html" })
  luasnip.filetype_extend("typescriptreact", { "html" })

  local kind_icons = {
    Text = "",
    Method = "",
    Function = "",
    Constructor = "",
    Field = "",
    Variable = "",
    Class = "ﴯ",
    Interface = "",
    Module = "",
    Property = "ﰠ",
    Unit = "",
    Value = "",
    Enum = "",
    Keyword = "",
    Snippet = "",
    Color = "",
    File = "",
    Reference = "",
    Folder = "",
    EnumMember = "",
    Constant = "",
    Struct = "",
    Event = "",
    Operator = "",
    TypeParameter = "",
  }

  cmp.setup({
    formatting = {
      format = function(entry, vim_item)
        vim_item.kind = string.format(
          "%s %s",
          kind_icons[vim_item.kind],
          vim_item.kind
        )

        vim_item.menu = ({
          buffer = "[Buffer]",
          nvim_lsp = "[LSP]",
          luasnip = "[LuaSnip]",
          nvim_lua = "[Lua]",
          latex_symbols = "[LaTeX]",
        })[entry.source.name]

        return vim_item
      end
    },
    snippet = {
      expand = function(args)
        luasnip.lsp_expand(args.body)
      end,
    },
    window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ["<C-d>"] = cmp.mapping.scroll_docs(-4),
      ["<C-f>"] = cmp.mapping.scroll_docs(4),
      ["<C-n>"] = cmp.mapping.complete({}),
      ["<C-e>"] = cmp.mapping.abort(),
      -- Accept currently selected item. Set `select` to `false` to only
      -- confirm explicitly selected items.
      ["<CR>"] = cmp.mapping.confirm({ select = true }),
      ["<Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        elseif luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        else
          fallback()
        end
      end, { "i", "s" }),
      ["<S-Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif luasnip.jumpable(-1) then
          luasnip.jump(-1)
        else
          fallback()
        end
      end, { "i", "s" }),
    }),
    sources = cmp.config.sources({
      { name = "nvim_lsp" },
      { name = "luasnip" },
    }, {
      { name = "buffer" },
      { name = "path" },
    })
  })

  cmp.setup.cmdline(":", {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = "path" }
    }, {
      { name = "cmdline" }
    })
  })

  cmp.setup.cmdline("/", {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = "buffer" }
    }
  })
end

--------------------------------------------------------------------------------
--|=============================================================================
--|
--| PLUGIN MANAGER
--|
--|=============================================================================
--------------------------------------------------------------------------------

local function load_plugins()
  require("packer").startup({
    {
      { "wbthomason/packer.nvim" },

      {
        "neovim/nvim-lspconfig",
        requires = { "williamboman/nvim-lsp-installer" },
        config = config_lsp,
      },

      {
        "jose-elias-alvarez/null-ls.nvim",
        requires = { "nvim-lua/plenary.nvim" },
        config = config_null_ls,
      },

      {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
        config = config_treesitter,
      },

      { "nvim-treesitter/nvim-treesitter-textobjects" },

      {
        "nvim-telescope/telescope.nvim",
        requires = {
          { "nvim-lua/plenary.nvim" },
          { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
        },
        config = config_telescope,
      },

      {
        "kyazdani42/nvim-tree.lua",
        requires = { "kyazdani42/nvim-web-devicons", opt = true },
        config = config_nvim_tree,
      },

      {
        "hrsh7th/nvim-cmp",
        requires = {
          "hrsh7th/cmp-nvim-lsp",
          "hrsh7th/cmp-buffer",
          "hrsh7th/cmp-path",
          "hrsh7th/cmp-cmdline",

          "L3MON4D3/LuaSnip",
          "rafamadriz/friendly-snippets",
          "saadparwaiz1/cmp_luasnip",
        },
        config = config_cmp,
      },

      {
        "nvim-lualine/lualine.nvim",
        requires = { "kyazdani42/nvim-web-devicons" },
        config = config_lualine,
      },

      {
        "akinsho/bufferline.nvim",
        requires = { "kyazdani42/nvim-web-devicons" },
        tag = "v2.*",
        config = config_bufferline,
      },

      { "tpope/vim-surround" },
      { "tpope/vim-endwise" },
      { "numToStr/Comment.nvim", config = config_comment },
      { "windwp/nvim-autopairs", config = config_autopairs },
      { "andymass/vim-matchup" },

      { "tpope/vim-repeat" },
      { "tpope/vim-eunuch" },

      { "tpope/vim-fugitive" },
      { "tpope/vim-rhubarb" },
      { "lewis6991/gitsigns.nvim", config = config_gitsigns },

      { "folke/which-key.nvim", config = config_which_key },
      { "kyazdani42/nvim-web-devicons", config = config_devicons },

      { "lukas-reineke/indent-blankline.nvim", config = config_indent_blankline },

      { "tpope/vim-rails" },

      { "navarasu/onedark.nvim" },
    },
    config = {
      display = {
        open_fn = function()
          return require("packer.util").float({ border = "rounded" })
        end,
      },
    },
  })
end

--------------------------------------------------------------------------------
--|=============================================================================
--|
--| COLORSCHEME
--|
--|=============================================================================
--------------------------------------------------------------------------------

vim.opt.background = "dark"

local onedark = require("onedark")

onedark.setup({
  -- Main options --
  style = "dark", -- Default theme style. Choose between "dark", "darker", "cool", "deep", "warm", "warmer" and "light"
  transparent = false, -- Show/hide background
  term_colors = true, -- Change terminal color as per the selected theme style
  ending_tildes = false, -- Show the end-of-buffer tildes. By default they are hidden
  cmp_itemkind_reverse = false, -- reverse item kind highlights in cmp menu
  -- toggle theme style ---
  toggle_style_key = "<leader>ts", -- Default keybinding to toggle
  toggle_style_list = { "dark", "darker", "cool", "deep", "warm", "warmer", "light" }, -- List of styles to toggle between

  -- Change code style ---
  -- Options are italic, bold, underline, none
  -- You can configure multiple style with comma seperated, For e.g., keywords = "italic,bold"
  code_style = {
    comments = "italic",
    keywords = "none",
    functions = "none",
    strings = "none",
    variables = "none"
  },

  -- Custom colors & highlight groups --
  colors = {},
  highlights = {
    VertSplit = { fg = "$black", bg = "$bg0" },

    StatusLine = { fg = "$fg", bg = "$black" },
    StatusLineNC = { fg = "$fg", bg = "$black" },
    -- StatusLineTerm = {fg = "$black", bg = "$black"},
    -- StatusLineTermNC = {fg = "$black", bg = "$black"},
    MsgArea = { fg = "$fg", bg = "$bg0" },

    WhichKeyFloat = { bg = "$black" },
  },

  -- Plugins Config --
  diagnostics = {
    darker = true, -- darker colors for diagnostic
    undercurl = true, -- use undercurl instead of underline for diagnostics
    background = true, -- use background color for virtual text
  },
})

onedark.load()

--------------------------------------------------------------------------------
--|=============================================================================
--|
--| COMMANDS
--|
--|=============================================================================
--------------------------------------------------------------------------------

local function insert_timestamp(opts)
  local cursor_position = vim.api.nvim_win_get_cursor(0)

  local row = cursor_position[1] - 1
  local column = cursor_position[2]

  local timestamp_format
  if opts.args == "" then
    timestamp_format = "%Y%m%d%H%M%S"
  else
    timestamp_format = opts.args
  end

  local timestamp = os.date(timestamp_format)

  -- print("(" .. row .. ", " .. column .. ")   " .. timestamp .. "  END")

  vim.api.nvim_buf_set_text(0, row, column, row, column, { timestamp })
end

local function set_advent_of_code_mappings()
  local function run_file_in_tmux_pane()
    io.popen("tmux send -t 2 'ruby " .. vim.fn.expand("%") .. "' Enter")
  end

  vim.keymap.set("n", "<CR>", run_file_in_tmux_pane, { silent = true })
end

local function load_commands()
  vim.api.nvim_create_user_command("InsertTimestamp", insert_timestamp, {})
  vim.api.nvim_create_user_command("SetAocMappings", set_advent_of_code_mappings, {})
end

--------------------------------------------------------------------------------
--|=============================================================================
--|
--| MISC
--|
--|=============================================================================
--------------------------------------------------------------------------------

local function highlight_on_yank()
  local highlight_group = vim.api.nvim_create_augroup("YankHighlight", {
    clear = true
  })

  vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
      vim.highlight.on_yank()
    end,
    group = highlight_group,
    pattern = "*",
  })
end

local function load_misc()
  vim.cmd([[
    function! s:OpenHelpInNewTab()
      if &buftype == 'help'
        if winnr('$') > 1
          wincmd T
        endif
      endif
    endfunction

    function! s:RemoveTrailingWhitespace()
      if &filetype == 'markdown'
        return
      endif

      %s/\s\+$//e
    endfunction

    augroup misc
      autocmd!

      autocmd BufWritePre * call <SID>RemoveTrailingWhitespace()
      autocmd BufEnter *.txt call <SID>OpenHelpInNewTab()
      autocmd FileType gitcommit :set spell spelllang=en_us
      autocmd FileType markdown :setlocal textwidth=80
    augroup END
  ]])

  highlight_on_yank()
end

--------------------------------------------------------------------------------
--|=============================================================================
--|
--| INIT
--|
--|=============================================================================
--------------------------------------------------------------------------------

local function load_config()
  load_options()
  load_keymaps()
  load_commands()
  load_misc()
  load_plugins()
end

load_config()
