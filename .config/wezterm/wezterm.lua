local wezterm = require 'wezterm'
local utils = require 'lua.utils'
local appearance = require 'lua.appearance'
local font = require 'lua.font'
local keys = require 'lua.keys'
local plugin_config = require 'lua.plugin_config'

local smart_workspace = wezterm.plugin.require("https://github.com/MLFlexer/smart_workspace_switcher.wezterm")
local quick_domains = wezterm.plugin.require("https://github.com/DavidRR-F/quick_domains.wezterm")

-- config

local c = {}
if wezterm.config_builder then
  c = wezterm.config_builder()
end
c.default_prog = utils.is_windows and { "pwsh", "-NoLogo" } or { "zsh" }
c.default_workspace = "main"
c.keys = keys.tmux_session_inactive
c.key_tables = { tmux = keys.tmux }

appearance.apply_to_config(c)
font.apply_to_config(c)

-- plugins

quick_domains.apply_to_config(c, plugin_config.quick_domains)
smart_workspace.apply_to_config(c)

-- event hooks

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
