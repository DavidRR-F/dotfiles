local wezterm = require "wezterm"

--- @class _Appearence
local _Appearence = {}

_Appearence.apply_to_config = function(c)
  c.color_scheme = 'Catppuccin Mocha'
  local scheme = wezterm.color.get_builtin_schemes()["Catppuccin Mocha"]
  c.font = wezterm.font { family = "0xProto Nerd Font", weight = "Regular" }
  c.font_size = 12
  c.font_rules = {
    {
      intensity = "Normal",
      italic = true,
      font = wezterm.font { family = "0xProto Nerd Font", weight = "Regular", italic = true, harfbuzz_features = { "ss01" } }
    }
  }
  c.adjust_window_size_when_changing_font_size = false
  c.colors = {
    background = scheme.background,
    cursor_border = scheme.ansi[2],
    tab_bar = {
      background = scheme.tab_bar.inactive_tab.bg_color,
      active_tab = {
        bg_color = scheme.background,
        fg_color = scheme.ansi[3],
      },
      inactive_tab = {
        bg_color = scheme.background,
        fg_color = scheme.ansi[1],
      },
      inactive_tab_hover = {
        bg_color = scheme.background,
        fg_color = scheme.ansi[1],
      }
    }
  }
  c.window_padding = {
    left = 0,
    right = 0,
    top = 5,
    bottom = 0,
  }
  c.window_background_image_hsb = {
    brightness = 1,
    saturation = 1,
    hue = 1
  }
  c.window_decorations = 'RESIZE'
  c.show_new_tab_button_in_tab_bar = false
  c.enable_scroll_bar = false
  c.tab_bar_at_bottom = false
  c.tab_max_width = 50
  c.use_fancy_tab_bar = false
end

return _Appearence
