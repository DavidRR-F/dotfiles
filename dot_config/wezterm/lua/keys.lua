local wezterm = require 'wezterm'
local act = wezterm.action
local workspace_switcher = wezterm.plugin.require("https://github.com/MLFlexer/smart_workspace_switcher.wezterm")
local smart_ssh = wezterm.plugin.require('https://github.com/DavidRR-F/smart_ssh.wezterm')

local M = {}

M.leader = { key = "Space", mods = "CTRL" }

M.general = {
  {
    key = "F11",
    mods = "NONE",
    action = act.ToggleFullScreen,
  },
  { key = "Space", mods = "CTRL",         action = act.ActivateKeyTable { name = "tmux", one_shot = true }, },
  { key = "Enter", mods = "CTRL",         action = wezterm.action { SendString = "\x1b[13;5u" } },
  { key = "Enter", mods = "SHIFT",        action = wezterm.action { SendString = "\x1b[13;2u" } },
  { key = "v",     mods = "CTRL|SHIFT",   action = act.PasteFrom 'Clipboard' },
  { key = "c",     mods = "CTRL|SHIFT",   action = act.CopyTo 'Clipboard' },
  { key = "p",     mods = "CTRL|SHIFT",   action = act.ActivateCommandPalette },
  { key = "d",     mods = "CTRL|SHIFT",   action = act.ShowDebugOverlay },
  { key = "w",     mods = "CTRL|SHIFT",   action = act.QuitApplication },
  { key = "-",     mods = "CTRL",         action = act.DecreaseFontSize },
  { key = "=",     mods = "CTRL",         action = act.IncreaseFontSize },
  { key = '%',     mods = "LEADER|SHIFT", action = act.SplitHorizontal { domain = "CurrentPaneDomain" } },
  { key = '"',     mods = "LEADER|SHIFT", action = act.SplitVertical { domain = "CurrentPaneDomain" } },
  { key = "(",     mods = "LEADER|SHIFT", action = act.SwitchWorkspaceRelative(-1) },
  { key = ")",     mods = "LEADER|SHIFT", action = act.SwitchWorkspaceRelative(1) },
  { key = "&",     mods = "LEADER|SHIFT", action = act.CloseCurrentTab { confirm = true } },
  {
    key = "!",
    mods = "LEADER|SHIFT",
    action = wezterm.action_callback(function(_, pane)
      pane:move_to_new_tab()
    end)
  },
  { key = "c",     mods = "LEADER", action = act.SpawnTab("CurrentPaneDomain") },
  { key = "n",     mods = "LEADER", action = act.ActivateTabRelative(1) },
  { key = "p",     mods = "LEADER", action = act.ActivateTabRelative(-1) },
  { key = "x",     mods = "LEADER", action = act.CloseCurrentPane { confirm = true } },
  { key = "z",     mods = "LEADER", action = act.TogglePaneZoomState },
  { key = "Space", mods = "LEADER", action = act.RotatePanes "Clockwise" },
  { key = "[",     mods = "LEADER", action = act.ActivateCopyMode },
  { key = "s",     mods = "LEADER", action = workspace_switcher.switch_workspace() },
  { key = "d",     mods = "LEADER", action = smart_ssh.tab() },
  { key = "5",     mods = "LEADER", action = smart_ssh.hsplit() },
  { key = "'",     mods = "LEADER", action = smart_ssh.vsplit() },
  { key = "r",     mods = "LEADER", action = act.ReloadConfiguration },
  { key = "/",     mods = "LEADER", action = act.Search "CurrentSelectionOrEmptyString" },
  { key = "q",     mods = "LEADER", action = act.QuickSelect },
  {
    key = 'i',
    mods = 'LEADER|SHIFT',
    action = wezterm.action_callback(function()
      wezterm.plugin.update_all()
    end),
  },
  {
    key = 'w',
    mods = "LEADER",
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
