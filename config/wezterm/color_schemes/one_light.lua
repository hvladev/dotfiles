local wezterm = require("wezterm")
local module = {}

-- Monochrome -----------------------------------------------------------------
local white   = "#FFFFFF"
local mono_1 = "hsl(230, 8%, 24%)" -- default text
local mono_2 = "hsl(230, 6%, 44%)" -- lighter than mono_1
local mono_3 = "hsl(230, 4%, 64%)" -- lighter than mono_2
local black   = "#000000"

-- Colors ---------------------------------------------------------------------
local cyan          = "hsl(198, 99%, 37%)"
local blue          = "hsl(221, 87%, 60%)"
local purple        = "hsl(301, 63%, 40%)"
local green         = "hsl(119, 34%, 47%)"
local red           = "hsl(344, 84%, 43%)"
local bright_red    = "hsl(5, 74%, 59%)"
local orange        = "hsl(41, 99%, 30%)"
local bright_orange = "hsl(41, 99%, 38%)"

-- Base colors ----------------------------------------------------------------
local syntax_fg = mono_1;
local syntax_bg = "hsl(230, 1%, 98%)"
local syntax_gutter = "hsl(230, 1%, 62%)"
-- local syntax_guide = fade(@syntax-fg, 20%);
local syntax_accent = "hsl(230, 100%, 66%)"
local selection_bg = "hsl(0, 0%, 100%)"

local name = "One Light"
local colors = {
  background = syntax_bg,
  foreground = syntax_fg,

  cursor_bg = syntax_accent,
  cursor_fg = white,
  cursor_border = syntax_accent,

  selection_bg = selection_bg,
  selection_fg = "none",

  scrollbar_thumb = mono_3,
  split = black,

  ansi = {
    '#2c323c',               -- black
    red,                     -- red
    green,                   -- green
    orange,                  -- yellow
    blue,                    -- blue
    purple,                  -- magenta
    cyan,                    -- cyan
    '#5c6370',               -- white
  },

  brights = {
    '#3e4452',               -- black
    bright_red,              -- red
    green,                   -- green
    bright_orange,           -- yellow
    blue,                    -- blue
    purple,                  -- magenta
    cyan,                    -- cyan
    '#abb2bf',               -- white
  },

  -- TODO: 👇

  -- Since: 20220319-142410-0fcdea07
  -- When the IME, a dead key or a leader key are being processed and are effectively
  -- holding input pending the result of input composition, change the cursor
  -- to this color to give a visual cue about the compose state.
  compose_cursor = 'orange',

  -- Colors for copy_mode and quick_select
  -- available since: 20220807-113146-c2fee766
  -- In copy_mode, the color of the active text is:
  -- 1. copy_mode_active_highlight_* if additional text was selected using the mouse
  -- 2. selection_* otherwise
  copy_mode_active_highlight_bg = { Color = '#000000' },
  -- use `AnsiColor` to specify one of the ansi color palette values
  -- (index 0-15) using one of the names "Black", "Maroon", "Green",
  --  "Olive", "Navy", "Purple", "Teal", "Silver", "Grey", "Red", "Lime",
  -- "Yellow", "Blue", "Fuchsia", "Aqua" or "White".
  copy_mode_active_highlight_fg = { AnsiColor = 'Black' },
  copy_mode_inactive_highlight_bg = { Color = '#52ad70' },
  copy_mode_inactive_highlight_fg = { AnsiColor = 'White' },

  quick_select_label_bg = { Color = 'peru' },
  quick_select_label_fg = { Color = '#ffffff' },
  quick_select_match_bg = { AnsiColor = 'Navy' },
  quick_select_match_fg = { Color = '#ffffff' },
}

function module.apply_to_config(config)
  config.color_schemes[name] = colors
end

return module
