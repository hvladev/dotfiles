local wezterm = require("wezterm")
local color_schemes = require("color_schemes")

local config = wezterm.config_builder()
color_schemes.apply_to_config(config)

config.window_decorations = "RESIZE"
config.use_fancy_tab_bar = true

config.window_frame = {
  font = wezterm.font { family = 'Hack', weight = 'Regular' },
  font_size = 13.5,
  active_titlebar_bg = 'hsl(230, 1%, 83%)',
  inactive_titlebar_bg = 'black',
}

config.colors = {
  tab_bar = {
    inactive_tab_edge = '#8e8e90',
    background = 'hsl(230, 1%, 83%)',

    active_tab = {
      bg_color = '#fafafa',
      fg_color = '#232324',
      intensity = 'Bold',
      underline = 'None',
      italic = false,
      strikethrough = false,
    },

   inactive_tab = {
      bg_color = 'none',
      fg_color = '#8e8e90',
    },

    -- You can configure some alternate styling when the mouse pointer
    -- moves over inactive tabs
    inactive_tab_hover = {
      bg_color = '#3b3052',
      fg_color = '#909090',
      italic = true,

      -- The same options that were listed under the `active_tab` section above
      -- can also be used for `inactive_tab_hover`.
    },

    -- The new tab button that let you create new tabs
    new_tab = {
      bg_color = 'none',
      fg_color = '#8e8e90',
    },

    new_tab_hover = {
      bg_color = '#61AFEF',
      fg_color = '#ffffff',
    },
  },
}

wezterm.on('update-right-status', function(window, pane)
  window:set_left_status(wezterm.format {
    { Text = string.format(" ❖ %s ", window:active_workspace()) },
  })

  window:set_right_status(wezterm.format {
    { Text = string.format(" %s ", wezterm.hostname()) },
  })
end)

config.inactive_pane_hsb = {
  saturation = 1.0,
  brightness = 1.0,
}

config.font = wezterm.font 'Hack'
config.font_size = 15
config.line_height = 1.2
-- === Dark themes
--
config.color_scheme = 'One Dark'
-- config.color_scheme = 'Vs Code Dark+ (Gogh)'

-- === Light themes
--
-- config.color_scheme = 'Vs Code Light+ (Gogh)'
-- config.color_scheme = 'Windows 10 Light (base16)'
-- config.color_scheme = 'Catppuccin Latte'
-- config.color_scheme = 'Cupertino (base16)'
-- config.color_scheme = 'Terminal Basic'
-- config.color_scheme = 'One Light'
-- config.color_scheme = 'One Light (base16)'
-- config.color_scheme = 'One Light (Gogh)'
-- config.color_scheme = 'Gruvbox Light'
-- config.color_scheme = 'Gruvbox light, soft (base16)'
-- config.color_scheme = 'Solarized (light) (terminal.sexy)'
-- config.color_scheme = 'Ef-Tritanopia-Light'
-- config.color_scheme = 'Bluloco Zsh Light (Gogh)'

return config

