local wezterm = require 'wezterm';
local act = wezterm.action
local shell
local keys
if wezterm.target_triple == 'x86_64-pc-windows-msvc' then
  -- Configuration for Windows devices
  shell = { "powershell" }
  keys = {
    {
      key = "F11",
      mods = "NONE",
      action = wezterm.action.ToggleFullScreen,
    },
    {key="_", mods="ALT|SHIFT", action=wezterm.action{SplitVertical={domain="CurrentPaneDomain"}}},
      
      -- Open a new horizontal split
      {key="+", mods="ALT|SHIFT", action=wezterm.action{SplitHorizontal={domain="CurrentPaneDomain"}}},
      
      -- Resize panes
      {key="LeftArrow", mods="ALT|SHIFT", action=act.AdjustPaneSize {'Left', 5}},
      {key="DownArrow", mods="ALT|SHIFT", action=act.AdjustPaneSize {'Down', 5}}, 
      {key="UpArrow", mods="ALT|SHIFT", action=act.AdjustPaneSize {'Up', 5}},
      {key="RightArrow", mods="ALT|SHIFT", action=act.AdjustPaneSize {'Right', 5}}, 

      -- Move focus between panes
      {key="LeftArrow", mods="ALT", action=wezterm.action{ActivatePaneDirection="Left"}},
      {key="DownArrow", mods="ALT", action=wezterm.action{ActivatePaneDirection="Down"}},
      {key="UpArrow", mods="ALT", action=wezterm.action{ActivatePaneDirection="Up"}},
      {key="RightArrow", mods="ALT", action=wezterm.action{ActivatePaneDirection="Right"}},

    {key="d", mods="CTRL|SHIFT", action=wezterm.action{CloseCurrentPane={confirm=true}}},
    { key = 'v', mods = 'CTRL', action = act.PasteFrom 'Clipboard' },
  }
else
  -- Configuration for Linux devices
  shell = { "bash" }
  keys = {
    {
      key = "F11",
      mods = "NONE",
      action = wezterm.action.ToggleFullScreen,
    }
  }
end

return {
   default_prog = shell,
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
  window_background_opacity = 0.7,
  win32_system_backdrop = 'Acrylic',
  macos_window_background_blur = 20,
  window_decorations = 'RESIZE',
  window_background_image_hsb = {
    brightness = 1,
    saturation = 1,
    hue = 1
  },
  keys = keys 
}

