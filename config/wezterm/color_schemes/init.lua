local wezterm = require("wezterm")
local module = {}

function module.apply_to_config(config)
  config.color_schemes = {}

  require("color_schemes/one_dark").apply_to_config(config)
  require("color_schemes/one_light").apply_to_config(config)
end

-- OLD STUFF
config = {}
config.color_schemes = {
  ['HV Dark'] = {
    background = '#282c34',
    foreground = '#abb2bf',

    cursor_bg = '#5c6370',
    cursor_fg = '#2c323c',
    cursor_border = '#5c6370',

    selection_bg = '#3b3f4c',
    selection_fg = 'none',

    scrollbar_thumb = '#262626',

    split = 'black',

    ansi = {
      '#2c323c', -- black
      '#e06c75', -- red
      '#98c379', -- green
      '#e5c07b', -- yellow
      '#61afef', -- blue
      '#c678dd', -- magenta
      '#56b6c2', -- cyan
      '#5c6370', -- white
    },
    brights = {
      '#3e4452', -- black
      '#e06c75', -- red
      '#98c379', -- green
      '#e5c07b', -- yellow
      '#61afef', -- blue
      '#c678dd', -- magenta
      '#56b6c2', -- cyan
      '#abb2bf', -- white
    },

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
  },
  ['HV Light'] = {
    background = 'white',
    foreground = 'black',

    ansi = {
      '#000000', -- black
      '#dc2626', -- red
      '#16a34a', -- green
      '#d97706', -- yellow
      '#2563eb', -- blue
      '#9333ea', -- magenta
      '#0891b2', -- cyan
      '#a3a3a3', -- white
    },

    brights = {
      '#525252', -- black
      '#f87171', -- red
      '#4ade80', -- green
      '#fbbf24', -- yellow
      '#60a5fa', -- blue
      '#c084fc', -- magenta
      '#22d3ee', -- cyan
      '#ffffff', -- white
    },
  },
}

return module
