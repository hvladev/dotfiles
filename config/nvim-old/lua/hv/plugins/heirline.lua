return {
	"rebelot/heirline.nvim",
  event = "VeryLazy",
  config = function()
		local heirline = require("heirline")
    local conditions = require("heirline.conditions")
    local utils = require("heirline.utils")
    local colors = require("onedark.colors")

		conditions.buffer_not_empty = function()
			return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
		end

		conditions.hide_in_width = function(size)
			return vim.api.nvim_get_option("columns") > (size or 40)
		end

    -- {
    --   bg0 = "#282c34",
    --   bg1 = "#31353f",
    --   bg2 = "#393f4a",
    --   bg3 = "#3b3f4c",
    --   bg_blue = "#73b8f1",
    --   bg_d = "#21252b",
    --   bg_yellow = "#ebd09c",
    --   black = "#181a1f",
    --   blue = "#61afef",
    --   cyan = "#56b6c2",
    --   dark_cyan = "#2b6f77",
    --   dark_purple = "#8a3fa0",
    --   dark_red = "#993939",
    --   dark_yellow = "#93691d",
    --   diff_add = "#31392b",
    --   diff_change = "#1c3448",
    --   diff_delete = "#382b2c",
    --   diff_text = "#2c5372",
    --   fg = "#abb2bf",
    --   green = "#98c379",
    --   grey = "#5c6370",
    --   light_grey = "#848b98",
    --   none = "none",
    --   orange = "#d19a66",
    --   purple = "#c678dd",
    --   red = "#e86671",
    --   yellow = "#e5c07b"
    -- }

    heirline.load_colors(colors)

		local VIMODE_COLORS = {
      n = colors.green,
      no = colors.orange,
      v = colors.purple,
      V = colors.purple,
      ["\22"] = colors.purple,
      s = colors.ligth_grey,
      S = colors.ligth_grey,
      ["\19"] = colors.ligth_grey,
      i = colors.blue,
      R = colors.cyan,
      c = colors.yellow,
      cv = colors.yellow,
      r = colors.orange,
      ["!"] = colors.red,
      t = colors.red,
    }

		local Space = { provider = " " }
		local SpaceWide = { Space, Space }
		local Align = { provider = "%=" }

		local ViModeSepLeft = {
			init = function(self)
        self.mode_1char = vim.fn.mode(1):sub(1, 1)
        self.mode_2chars = vim.fn.mode(1):sub(1, 2)

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
        local mode_color = VIMODE_COLORS[self.mode_2chars] or
          VIMODE_COLORS[self.mode_1char]

				return { fg = mode_color, bg = colors.bg_d }
			end,
			update = {
				"ModeChanged",
			},
		}

		local ViModeSepRight = {
			init = function(self)
        self.mode_1char = vim.fn.mode(1):sub(1, 1)
        self.mode_2chars = vim.fn.mode(1):sub(1, 2)
			end,
			provider = "▐",
			hl = function(self)
        local mode_color = VIMODE_COLORS[self.mode_2chars] or
          VIMODE_COLORS[self.mode_1char]
        local bg = colors.black

        if #vim.api.nvim_list_tabpages() > 1 then
          bg = colors.bg_d
        end

				return { fg = mode_color, bg = bg }
			end,
		}

    local ViMode = {
      -- get vim current mode, this information will be required by the provider
      -- and the highlight functions, so we compute it only once per component
      -- evaluation and store it as a component attribute
      init = function(self)
        -- :h mode()
        self.mode_1char = vim.fn.mode(1):sub(1, 1)
        self.mode_2chars = vim.fn.mode(1):sub(1, 2)

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
        -- :help mode()
        mode_names = {
          n = "N", -- NORMAL
          no = "O", -- OP
          v = "V", -- VISUAL
          V = "V", -- VLINE
          ["\22"] = "V", -- CTRL_V -- VBLOCK
          s = "S", -- SELECT
          S = "S", -- SLINE
          ["\19"] = "S", -- CTRL-S -- SBLOCK
          i = "I", -- INSERT
          R = "R", -- REPLACE
          c = "C", -- COMMAND
          cv = "C", -- gQ -- COMMAND[Ex]
          r = "PROMPT",
          ["!"] = "SHELL",
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
        local mode_name = self.mode_names[self.mode_2chars] or
          self.mode_names[self.mode_1char]

        return string.format(" %s ", mode_name)
      end,
      -- Same goes for the highlight. Now the foreground will change according to the current mode.
      hl = function(self)
        local mode_color = VIMODE_COLORS[self.mode_2chars] or
          VIMODE_COLORS[self.mode_1char]

				return { fg = mode_color, bg = colors.bg_d, bold = true }
      end,
      -- Re-evaluate the component only on ModeChanged event!
      -- This is not required in any way, but it's there, and it's a small
      -- performance improvement.
      update = {
        "ModeChanged",
      },
    }

		local ViModePowerline = {
			provider = "",
      hl = { fg = colors.bg_d },
		}

    local FileIcon = {
      init = function(self)
        local filename = vim.api.nvim_buf_get_name(0)
        local extension = vim.fn.fnamemodify(filename, ":e")
        self.icon, self.icon_color = require("nvim-web-devicons").get_icon_color(
          filename,
          extension,
          { default = true }
        )
      end,
      provider = function(self)
        return self.icon and (self.icon .. " ")
      end,
      hl = function(self)
        return { fg = self.icon_color }
      end
    }

    local ModifiedFlag = {
      condition = function ()
        return vim.bo.modified
      end,
      provider = " ",
      hl = { fg = colors.yellow },
    }

    local FileNameIcon = {
      fallthrough = false,
      ModifiedFlag,
      FileIcon,
    }

    local ReadOnly = {
      condition = function()
        return not vim.bo.modifiable or vim.bo.readonly
      end,
      {
        provider = "",
        hl = { fg = colors.yellow },
      },
      SpaceWide,
    }

    local FileName = {
      init = function(self)
        self.filename = vim.api.nvim_buf_get_name(0)
      end,
      hl = { fg = colors.fg, bold = true },
      FileNameIcon,
      {
        provider = function(self)
          -- For other options, see :h filename-modifers
          -- local filename = vim.fn.fnamemodify(self.filename, ":~:.")
          -- local filename = vim.fn.fnamemodify(self.filename, [[:p:gs?.*/\(.*/.*\)?\1?]])
          local filename = vim.fn.fnamemodify(self.filename, ":t")

          if filename == "" then
            return "[No Name]"
          end

          if not conditions.width_percent_below(#filename, 0.25) then
            filename = vim.fn.pathshorten(filename)
          end

          return filename
        end,
      },
      Space,
      ReadOnly,
      SpaceWide,
    }

    local Diagnostic = {
      condition = function()
        return #vim.diagnostic.get() > 0
      end,
      {
        provider = "󰇺 DGS",
        hl = { fg = colors.yellow },
      },
      SpaceWide,
    }

		local FileType = {
      condition = function()
        return conditions.hide_in_width()
      end,
      SpaceWide,
      FileIcon,
      {
        provider = function()
          local filetype = vim.bo.filetype

          if filetype == "" then
            filetype = "n/a"
          end

          return filetype
        end,
      },
		}

    local LSPActive = {
      update = { "LspAttach", "LspDetach" },
      condition = function()
        return conditions.hide_in_width and conditions.lsp_attached()
      end,
      SpaceWide,
      { provider  = " ", hl = { fg = colors.green } },
      { provider  = "LSP" },
    }

		local FileFormat = {
			condition = function()
				return conditions.buffer_not_empty() and conditions.hide_in_width()
			end,
      SpaceWide,
      {
        provider = function()
          local fmt = vim.bo.fileformat

          if fmt == "unix" then
            return "LF"
          elseif fmt == "mac" then
            return "CR"
          else
            return "CRLF"
          end
        end,
      },
		}

		local FileEncoding = {
			condition = function()
				return conditions.buffer_not_empty() and conditions.hide_in_width()
			end,
      SpaceWide,
      {
        provider = function()
          local encoding = (vim.bo.fenc ~= "" and vim.bo.fenc) or vim.o.enc
          return encoding:upper()
        end,
      },
		}

    local FileSize = {
			condition = function()
				return conditions.buffer_not_empty() and conditions.hide_in_width()
			end,
      SpaceWide,
      {
        provider = function()
          -- stackoverflow, compute human readable file size
          local suffix = { 'b', 'k', 'M', 'G', 'T', 'P', 'E' }
          local fsize = vim.fn.getfsize(vim.api.nvim_buf_get_name(0))
          fsize = (fsize < 0 and 0) or fsize

          if fsize < 1024 then
            return fsize..suffix[1]
          end

          local i = math.floor((math.log(fsize) / math.log(1024)))

          return string.format("%.2g%s", fsize / math.pow(1024, i), suffix[i + 1])
        end,
      },
    }

		local Ruler = {
			condition = function()
				return conditions.hide_in_width()
			end,
			{ provider = "%l:%c" },
      SpaceWide,
		}

		local Git = {
      condition = conditions.is_git_repo,
      init = function(self)
        self.status_dict = vim.b.gitsigns_status_dict
      end,
			hl = { bg = colors.black },
      -- {
      --   provider = "",
      --   hl = { fg = colors.bg_d, bg = colors.black },
      -- },
			{
				provider = " ",
        hl = { fg = colors.yellow },
			},
			{
        provider = function(self)
          return self.status_dict.head
        end,
        -- hl = { fg = colors.yellow },
			},
      SpaceWide,
		}

    local Tabpage = {
      provider = function(self)
        return "%" .. self.tabnr .. "T " .. self.tabnr .. " %T"
      end,
      hl = function(self)
        local fg = colors.light_grey
        local bold = false

        if self.is_active then
          fg = colors.fg
          bold = true
        end

        return { fg = fg, bg = colors.bg_d, bold = bold }
      end,
    }

    local TabPages = {
      condition = function()
        return #vim.api.nvim_list_tabpages() > 1
      end,
      {
        provider = "",
        hl = { fg = colors.bg_d, bg = colors.black },
      },
      utils.make_tablist(Tabpage),
    }

    local StatusLine = {
      hl = { fg = colors.light_grey, bg = colors.black },

      ViModeSepLeft,
      ViMode,
      ViModePowerline,
      Space,

      Git,
      FileName,
      Ruler,
      Diagnostic,
      { provider = "%<" },

      Align,

      FileType,
      LSPActive,
      FileEncoding,
      FileFormat,
      FileSize,

      Space,
      TabPages,
      ViModeSepRight,
    }

    -- heirline.setup({ statusline = StatusLine, tabline = TabLine })
    heirline.setup({ statusline = StatusLine })
  end,
}
