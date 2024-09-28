local wez = require "wezterm"
local plugin_config = require "lua.plugin_config"
local tabline = wez.plugin.require("https://github.com/michaelbrusegard/tabline.wez")
local workspace = wez.plugin.require("https://github.com/MLFlexer/smart_workspace_switcher.wezterm")
local bg = "rgba(30, 30, 46, 0.9)"

local M = {}

-- Catppuccin Mocha
-- ansi = [
--   '#45475a',
--   '#f38ba8',
--   '#a6e3a1',
--   '#f9e2af',
--   '#89b4fa',
--   '#f5c2e7',
--   '#94e2d5',
--   '#bac2de',
-- ]
-- background = '#1e1e2e'
-- brights = [
--   '#585b70',
--   '#f38ba8',
--   '#a6e3a1',
--   '#f9e2af',
--   '#89b4fa',
--   '#f5c2e7',
--   '#94e2d5',
--   '#a6adc8',
-- ]
-- compose_cursor = '#f2cdcd'
-- cursor_bg = '#f5e0dc'
-- cursor_border = '#f5e0dc'
-- cursor_fg = '#11111b'
-- foreground = '#cdd6f4'
-- scrollbar_thumb = '#585b70'
-- selection_bg = '#585b70'
-- selection_fg = '#cdd6f4'
-- split = '#6c7086'
-- visual_bell = '#313244'
local tab_background = 'rgb(24, 24, 37)'

M.apply_to_config = function(c)
  -- base config
  c.color_scheme = 'Catppuccin Mocha'
  local scheme = wez.color.get_builtin_schemes()["Catppuccin Mocha"]
  c.colors = {
    background = scheme.background,
    cursor_border = scheme.ansi[2],
    tab_bar = {
      background = tab_background,
      active_tab = {
        bg_color = scheme.background,
        fg_color = scheme.ansi[3],
      },
      inactive_tab = {
        bg_color = tab_background,
        fg_color = scheme.ansi[1],
      },
      inactive_tab_hover = {
        bg_color = tab_background,
        fg_color = scheme.ansi[1],
      }
    }
  }
  --c.window_background_opacity = 0.9
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
  -- workspace choices
  workspace.get_choices = function(opts)
    return workspace.choices.get_workspace_elements({})
  end
  -- tabline config
  tabline.setup(plugin_config.tabline)
end

return M
