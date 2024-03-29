local wezterm = require("wezterm")
local module = {}

-- Config ---------------------------------------------------------------------
local syntax_hue = "220"
local syntax_saturation = "13%"
local syntax_brightness = "18%"
-- hsl(220, 13%, 18%) => #282C34

-- Monochrome -----------------------------------------------------------------
local white   = "#FFFFFF"
local mono_1  = "#ABB2BF" -- default text
local mono_2  = "#828997" -- darker than mono_1
local mono_3  = "#5C6370" -- darker than mono_2
local black   = "#000000"

-- Colors ---------------------------------------------------------------------
local cyan          = "#56B6C2"
local blue          = "#61AFEF"
local purple        = "#C678DD"
local green         = "#98C379"
local red           = "#BE5046"
local bright_red    = "#E06C75"
local orange        = "#D19A66"
local bright_orange = "#E5C07B"

-- Base colors ----------------------------------------------------------------
local syntax_fg = mono_1;
local syntax_bg = "#282C34"
local syntax_gutter = "#636D83"
-- local syntax_guide = fade(@syntax-fg, 15%);
local syntax_accent = "#528BFF"
local selection_bg = "#3E4451"

local name = "One Dark"
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
