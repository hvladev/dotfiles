return {
	"rebelot/heirline.nvim",
  event = "VeryLazy", -- LazyVimStarted
  config = function()
		local heirline = require("heirline")
    local conditions = require("heirline.conditions")
    local utils = require("heirline.utils")
    local colors = require("onedark.colors")

    heirline.load_colors(colors)

		local VIMODE_COLORS = {
      n = colors.green,
      no = colors.orange,
      nov = colors.orange,
      noV = colors.orange,
      ["no\22"] = colors.orange,
      niI = colors.green,
      niR = colors.green,
      niV = colors.green,
      nt = colors.red,
      ntT = colors.red,
      v = colors.purple,
      vs = colors.purple,
      V = colors.purple,
      Vs = colors.purple,
      ["\22"] = colors.purple,
      ["\22s"] = colors.purple,
      s = colors.purple,
      S = colors.purple,
      ["\19"] = colors.purple,
      i = colors.blue,
      ic = colors.blue,
      ix = colors.blue,
      R = colors.yellow,
      Rc = colors.yellow,
      Rx = colors.yellow,
      Rv = colors.yellow,
      Rvc = colors.yellow,
      Rvx = colors.yellow,
      c = colors.cyan,
      cv = colors.cyan,
      r = colors.orange,
      rm = colors.orange,
      ["r?"] = colors.orange,
      ["!"] = colors.red,
      t = colors.red,
    }

		local ViModeSepLeft = {
			init = function(self)
				self.mode = vim.api.nvim_get_mode().mode
				if not self.once then
					vim.api.nvim_create_autocmd("ModeChanged", {
						pattern = "*:*o",
						command = "redrawstatus",
					})
					self.once = true
				end
			end,
			provider = "▌",
			hl = function(self)
				local mode = self.mode:sub(1, 1)
				return { fg = VIMODE_COLORS[mode], bg = colors.bg_d }
			end,
			update = {
				"ModeChanged",
			},
		}

    local ViMode = {
      -- get vim current mode, this information will be required by the provider
      -- and the highlight functions, so we compute it only once per component
      -- evaluation and store it as a component attribute
      init = function(self)
        self.mode = vim.fn.mode(1) -- :h mode()

        -- execute this only once, this is required if you want the ViMode
        -- component to be updated on operator pending mode
        if not self.once then
          vim.api.nvim_create_autocmd("ModeChanged", {
            pattern = "*:*o",
            command = 'redrawstatus'
          })
          self.once = true
        end
      end,
      -- Now we define some dictionaries to map the output of mode() to the
      -- corresponding string. We can put these into `static` to compute
      -- them at initialisation time.
      static = {
        -- change the strings if you like it vvvvverbose!
        -- :help mode()
        mode_names = {
          -- Normal
          n = "NORMAL",

          -- Operator-pending
          no = "OP",

          -- Operator-pending (forced charwise "o_v")
          nov = "OP[v]",

          -- Operator-pending (forced linewise "o_V")
          noV = "OP[V]",

          -- Operator-pending (forced blockwise "o_CTRL-V")
          ["no\22"] = "OP[^V]",

          -- Normal using "i_CTRL-O" in "Insert-mode"
          niI = "NORMAL[iI]",

          -- Normal using "i_CTRL-O" in "Replace-mode"
          niR = "NORMAL[iR]",

          -- Normal using "i_CTRL-O" in "Virtual-Replace-mode"
          niV = "NORMAL[iV]",

          -- Normal in "terminal-emulator" (insert goes to Terminal mode)
          nt = "NORMAL[t]",

          -- Normal using "t_CTRL-\_CTRL-O" in "Terminal-mode"
          ntT = "NORMAL[tT]",

          -- Visual by character
          v = "VISUAL",

          -- Visual by character using "v_CTRL-O" in Select mode
          vs = "VISUAL[s]",

          -- Visual by line
          V = "VLINE",

          -- Visual by line using "v_CTRL-O" in Select mode
          Vs = "VLINE[s]",

          -- Visual blockwise (CTRL_V)
          ["\22"] = "VBLOCK",

          -- Visual blockwise using "v_CTRL-O" in Select mode
          ["\22s"] = "VBLOCK[s]",

          -- Select by character
          s = "SELECT",

          -- Select by line
          S = "SLINE",

          -- Select blockwise (CTRL-S)
          ["\19"] = "SBLOCK",

          -- Insert
          i = "INSERT",

          -- Insert mode completion "compl-generic"
          ic = "INSERT[c]",

          -- Insert mode "i_CTRL-X" completion
          ix = "INSERT[x]",

          -- Replace "R"
          R = "REPLACE",

          -- Replace mode completion "compl-generic"
          Rc = "REPLACE[c]",

          -- Replace mode "i_CTRL-X" completion
          Rx = "REPLACE[x]",

          -- Virtual Replace "gR"
          Rv = "vREPLACE",

          -- Virtual Replace mode completion "compl-generic"
          Rvc = "vREPLACE[c]",

          -- Virtual Replace mode "i_CTRL-X" completion
          Rvx = "vREPLACE[x]",

          -- Command-line editing
          c = "COMMAND",

          -- Vim Ex mode "gQ"
          cv = "Ex",

          -- Hit-enter prompt
          r = "ENTER",

          -- The -- more -- prompt
          rm = "MORE",

          -- A ":confirm" query of some sort
          ["r?"] = "CONFIRM",

          -- Shell or external command is executing
          ["!"] = "SHELL",

          -- Terminal mode: keys go to the job
          t = "TERM",
        },
      },
      -- We can now access the value of mode() that, by now, would have been
      -- computed by `init()` and use it to index our strings dictionary.
      -- note how `static` fields become just regular attributes once the
      -- component is instantiated.
      -- To be extra meticulous, we can also add some vim statusline syntax to
      -- control the padding and make sure our string is always at least 2
      -- characters long. Plus a nice Icon.
      provider = function(self)
        -- return " %2("..self.mode_names[self.mode].."%) "
        return string.format(" %s ", self.mode_names[self.mode])
      end,
      -- Same goes for the highlight. Now the foreground will change according to the current mode.
      hl = function(self)
        -- local mode = self.mode:sub(1, 1) -- get only the first mode character
        local mode = self.mode
				return { fg = VIMODE_COLORS[mode], bg = colors.bg_d, bold = true }
      end,
      -- Re-evaluate the component only on ModeChanged event!
      -- This is not required in any way, but it's there, and it's a small
      -- performance improvement.
      update = {
        "ModeChanged",
      },
    }

    local StatusLine = {
      ViModeSepLeft,
      ViMode,
      -- ViModePowerline,
      -- FileNameBlock,
      -- FileType,
      -- FileSize,
      -- Ruler,
      -- Align,
      -- LSPActive,
      -- Diagnostics,
      -- FileEncoding,
      -- FileFormat,
      -- IndentSizes,
      -- GitPowerline,
      -- Git,
      -- ViModeSepRight,
    }

    local TabLine = { TabLineOffset, BufferLine, Align, TabPages }

    heirline.setup({ statusline = StatusLine, tabline = TabLine })
  end,
}
