local wezterm = require 'wezterm'
local utils = require 'lua.utils'
local appearance = require 'lua.appearance'
local font = require 'lua.font'
local keys = require 'lua.keys'

local smart_workspace = wezterm.plugin.require("https://github.com/MLFlexer/smart_workspace_switcher.wezterm")
local quick_domains = wezterm.plugin.require("https://github.com/DavidRR-F/quick_domains.wezterm")

local c = {}
if wezterm.config_builder then
  c = wezterm.config_builder()
end
c.default_prog = utils.is_windows and { "pwsh", "-NoLogo" } or { "zsh" }
c.default_workspace = "main"
c.keys = keys.tmux_session_inactive
c.key_tables = { tmux = keys.tmux }

quick_domains.apply_to_config(c,
  {
    keys = {
      attach = {
        key = 's',
        mods = 'SHIFT',
        tbl = 'tmux',
      },
      vsplit = {
        key = '-',
        mods = 'CTRL',
        tbl = 'tmux',
      },
      hsplit = {
        key = '=',
        mods = 'CTRL',
        tbl = 'tmux',
      },
    },
    auto = {
      ssh_ignore = false,
      exec_ignore = {
        ssh = false,
        docker = false,
        kubernetes = false,
      },
    }
  }
)

appearance.apply_to_config(c)
font.apply_to_config(c)
smart_workspace.apply_to_config(c)

wezterm.on("update-right-status", function(window, pane)
  if utils.is_tmux(pane) then
    window:set_config_overrides({
      keys = keys.tmux_session_active,
    })
  else
    window:set_config_overrides({
      keys = c.keys,
    })
  end
end)

return c
