local wezterm = require 'wezterm'
local act = wezterm.action
local workspace_switcher = wezterm.plugin.require("https://github.com/MLFlexer/smart_workspace_switcher.wezterm")
local utils = require 'lua.utils'
local function switch_domains()
  return wezterm.action_callback(function(window, pane)
    local sessions = {}

    for host, config in pairs(wezterm.enumerate_ssh_hosts()) do
      table.insert(sessions, {
        label = '󰣀 ' .. host,
        id = host,
      })
    end

    -- Create an input selector for choosing the SSH domain
    window:perform_action(
      act.InputSelector({
        action = wezterm.action_callback(function(window, pane, id, label)
          if id then
            -- Spawn a new tab and connect to the selected SSH host
            window:perform_action(
              act.AttachDomain(id),
              pane
            )
          end
        end),
        title = "Choose SSH Host",
        description = "Select a host and press Enter = accept, Esc = cancel, / = filter",
        fuzzy_description = " " .. "Hosts: ",
        choices = sessions,
        fuzzy = true,
      }),
      pane
    )
  end)
end
local M = {}

M.tmux_session_inactive = {
  { key = 'v',     mods = 'CTRL', action = act.PasteFrom 'Clipboard' },
  {
    key = "F11",
    mods = "NONE",
    action = act.ToggleFullScreen,
  },
  {
    key = "s",
    mods = "CTRL",
    action = switch_domains(),
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
  { key = 'v',   mods = 'CTRL', action = act.PasteFrom 'Clipboard' },
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
  { key = "d",     action = switch_domains() },
  { key = "s",     action = workspace_switcher.switch_workspace() },
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
