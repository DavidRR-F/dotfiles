local wezterm = require 'wezterm';
local act = wezterm.action

local keys = {
  {
    key = "Space",
    mods = "CTRL",
    action = wezterm.action.ActivateKeyTable {
      name = "prefix",
      one_shot = false,
    },
  },
  { key = 'v', mods = 'CTRL', action = act.PasteFrom 'Clipboard' },
  {
    key = "F11",
    mods = "NONE",
    action = wezterm.action.ToggleFullScreen,
  },
  { key = "h", mods = "CTRL", action = wezterm.action.ActivatePaneDirection("Left") },
  { key = "j", mods = "CTRL", action = wezterm.action.ActivatePaneDirection("Down") },
  { key = "k", mods = "CTRL", action = wezterm.action.ActivatePaneDirection("Up") },
  { key = "l", mods = "CTRL", action = wezterm.action.ActivatePaneDirection("Right") },
}

local key_tables = {
  prefix = {
    { key = "-",      action = wezterm.action.SplitHorizontal { domain = "CurrentPaneDomain" } },
    { key = "=",      action = wezterm.action.SplitVertical { domain = "CurrentPaneDomain" } },
    { key = "k",      action = wezterm.action.AdjustPaneSize { "Up", 10 } },
    { key = "j",      action = wezterm.action.AdjustPaneSize { "Down", 10 } },
    { key = "h",      action = wezterm.action.AdjustPaneSize { "Left", 10 } },
    { key = "l",      action = wezterm.action.AdjustPaneSize { "Right", 10 } },
    { key = "c",      action = wezterm.action.SpawnTab("CurrentPaneDomain") },
    { key = "n",      action = wezterm.action.ActivateTabRelative(1) },
    { key = "p",      action = wezterm.action.ActivateTabRelative(-1) },
    { key = "Escape", action = "PopKeyTable" },
  }
}

return {
  default_prog = { "powershell" },
  color_scheme = 'Catppuccin Mocha',
  font = wezterm.font("0xProtoNerdFontMono", { weight = "Regular" }),
  font_size = 16,
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
  keys = keys,
  key_tables = key_tables
}
