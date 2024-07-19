local wezterm = require 'wezterm'
local utils = require 'utils'
local keys = require 'keys'

require 'tabs'.setup()

local config = {
  default_prog = { "powershell" },
  color_scheme = 'Catppuccin Mocha',
  colors = { tab_bar = { background = 'rgba(30 30 50 0.8)' } },
  font = wezterm.font("0xProto Nerd Font Mono", { weight = "Regular" }),
  font_size = 14,
  window_padding = {
    left = 5,
    right = 5,
    top = 5,
    bottom = 5,
  },
  enable_scroll_bar = false,
  tab_bar_at_bottom = false,
  use_fancy_tab_bar = false,
  hide_tab_bar_if_only_one_tab = false,
  window_background_opacity = 0.8,
  window_decorations = 'RESIZE',
  window_background_image_hsb = {
    brightness = 1,
    saturation = 1,
    hue = 1
  },
  keys = keys.tmux_session_inactive,
  key_tables = { tmux = keys.tmux }
}

wezterm.on("update-right-status", function(window, pane)
  if utils.is_tmux(pane) then
    wezterm.log_info("Tmux pane detected, disabling WezTerm keys")
    window:set_config_overrides({
      keys = keys.tmux_session_active,
    })
  else
    wezterm.log_info("Non-tmux pane, enabling WezTerm keys")
    window:set_config_overrides({
      keys = config.keys,
    })
  end
end)

return config
