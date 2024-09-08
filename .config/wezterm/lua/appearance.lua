local wez = require "wezterm"

local bg = "rgba(30, 30, 46, 0.9)"

local M = {}

M.apply_to_config = function(c)
  c.color_scheme = 'Catppuccin Mocha'
  local scheme = wez.color.get_builtin_schemes()["Catppuccin Mocha"]
  c.colors = {
    tab_bar = {
      background = bg,
      active_tab = {
        bg_color = bg,
        fg_color = scheme.ansi[3],
      },
      inactive_tab = {
        bg_color = bg,
        fg_color = scheme.ansi[1],
      }
    }
  }
  c.window_background_opacity = 0.9
  c.window_padding = {
    left = 5,
    right = 5,
    top = 5,
    bottom = 5,
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

return M
