local wezterm = require 'wezterm'
local act = wezterm.action

local utils = require 'utils'

local M = {}

M.tmux_session_inactive = {
  { key = 'v', mods = 'CTRL', action = act.PasteFrom 'Clipboard' },
  {
    key = "F11",
    mods = "NONE",
    action = act.ToggleFullScreen,
  },
  { key = "l", mods = "CTRL|SHIFT", action = act.SpawnCommandInNewTab { args = { "wsl" }, },
  },
  { key = "Space", mods = "CTRL", action = act.ActivateKeyTable { name = "tmux", one_shot = true }, },
  utils.split_nav("move", "h"),
  utils.split_nav("resize", "h"),
  utils.split_nav("move", "j"),
  utils.split_nav("resize", "j"),
  utils.split_nav("move", "k"),
  utils.split_nav("resize", "k"),
  utils.split_nav("move", "l"),
  utils.split_nav("resize", "l"),
}

M.tmux_session_active = {
  { key = 'v', mods = 'CTRL', action = act.PasteFrom 'Clipboard' },
  {
    key = "F11",
    mods = "NONE",
    action = act.ToggleFullScreen,
  },
  { key = "l", mods = "CTRL|SHIFT", action = act.SpawnCommandInNewTab { args = { "wsl" }, },
  }
}

-- key tables

M.tmux = {
  { key = "-", action = act.SplitHorizontal { domain = "CurrentPaneDomain" } },
  { key = "=", action = act.SplitVertical { domain = "CurrentPaneDomain" } },
  { key = "k", action = act.AdjustPaneSize { "Up", 10 } },
  { key = "j", action = act.AdjustPaneSize { "Down", 10 } },
  { key = "h", action = act.AdjustPaneSize { "Left", 10 } },
  { key = "l", action = act.AdjustPaneSize { "Right", 10 } },
  { key = "c", action = act.SpawnTab("CurrentPaneDomain") },
  { key = "n", action = act.ActivateTabRelative(1) },
  { key = "p", action = act.ActivateTabRelative(-1) },
  { key = "x", action = act.CloseCurrentPane { confirm = true } },
}

return M
