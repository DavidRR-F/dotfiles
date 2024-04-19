local wezterm = require 'wezterm';
local act = wezterm.action
return {
  default_prog = { "bash" },
  color_scheme = 'Catppuccin Mocha',
  font_size = 14, 
  window_padding = {
    left = 5,
    right = 5,
    top = 5,
    bottom = 5,
  },
  enable_scroll_bar = true,
  tab_bar_at_bottom = true,
  use_fancy_tab_bar = false,
  hide_tab_bar_if_only_one_tab = true,
  window_background_opacity = 0.9,
  window_decorations = 'RESIZE',
  window_background_image_hsb = {
    brightness = 1,
    saturation = 1,
    hue = 1
  },
  keys = {
    { key = 'v', mods = 'CTRL', action = act.PasteFrom 'Clipboard' },
    {
      key = "F11",
      mods = "NONE",
      action = wezterm.action.ToggleFullScreen,
    }
  } 
}

