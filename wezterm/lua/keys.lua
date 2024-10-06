local wezterm = require 'wezterm'
local act = wezterm.action
local workspace_switcher = wezterm.plugin.require("https://github.com/MLFlexer/smart_workspace_switcher.wezterm")
local utils = require 'lua.utils'

local M = {}

M.tmux_session_inactive = {
  {
    key = "F11",
    mods = "NONE",
    action = act.ToggleFullScreen,
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
  { key = "F11", mods = "NONE", action = act.ToggleFullScreen },
}

-- key tables

M.tmux = {
  { key = "-",     action = act.SplitHorizontal { domain = "CurrentPaneDomain" } },
  { key = "=",     action = act.SplitVertical { domain = "CurrentPaneDomain" } },
  { key = "k",     action = act.AdjustPaneSize { "Up", 10 } },
  { key = "j",     action = act.AdjustPaneSize { "Down", 10 } },
  { key = "h",     action = act.AdjustPaneSize { "Left", 10 } },
  { key = "l",     action = act.AdjustPaneSize { "Right", 10 } },
  { key = "c",     action = act.SpawnTab("CurrentPaneDomain") },
  { key = "n",     action = act.ActivateTabRelative(1) },
  { key = "p",     action = act.ActivateTabRelative(-1) },
  { key = "x",     action = act.CloseCurrentPane { confirm = true } },
  { key = "m",     action = act.TogglePaneZoomState },
  { key = "q",     action = act.QuitApplication },
  { key = "r",     action = act.ReloadConfiguration },
  { key = "w",     action = act.CloseCurrentTab { confirm = true } },
  { key = "Space", action = act.RotatePanes "Clockwise" },
  { key = "0",     action = act.PaneSelect { mode = "SwapWithActive" } },
  { key = "[",     action = act.ActivateCopyMode },
  { key = "s",     action = workspace_switcher.switch_workspace() },
  {
    key = 'i',
    mods = 'SHIFT',
    action = wezterm.action_callback(function()
      wezterm.plugin.update_all()
    end),
  },
  {
    key = 'w',
    action = wezterm.action.PromptInputLine {
      description = 'Enter workspace name',
      action = wezterm.action_callback(function(window, pane, workspace)
        if workspace and #workspace > 0 then
          window:perform_action(wezterm.action.SwitchToWorkspace { name = workspace }, pane)
        end
      end),
    },
  },
}

return M
