local wezterm = require 'wezterm';

return {
  color_scheme = 'Catppuccin Mocha',
  font = wezterm.font_with_fallback {
    'Agave Nerd Font',
  },
  font_size = 14,
  font_rules = {
    {
      italic = true,
      font = wezterm.font_with_fallback {
        'Agave Nerd Font',
      },
    },
  },
  window_padding = {
    left = 5,
    right = 5,
    top = 5,
    bottom = 5,
  },
  enable_scroll_bar = true,
  tab_bar_at_bottom = true,
  use_fancy_tab_bar = false,
  window_decorations = 'RESIZE',
  window_background_image = ".dotfiles/term-theme/bgb.jpg",
  window_background_opacity = 1,
  window_background_image_hsb = {
    brightness = 1,
    saturation = 1,
    hue = 1
  },
  keys = {
    {
      key = "F11",
      mods = "NONE",
      action = wezterm.action.ToggleFullScreen,
    },  
  }
}
