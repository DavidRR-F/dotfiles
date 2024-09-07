local wezterm = require 'wezterm'
local utils = require 'utils'
local appearance = require 'appearance'
local font = require 'font'
local keys = require 'keys'
local bar = wezterm.plugin.require("https://github.com/adriankarlen/bar.wezterm")
local workspace_switcher = wezterm.plugin.require("https://github.com/MLFlexer/smart_workspace_switcher.wezterm")


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

workspace_switcher.apply_to_config(c)
bar.apply_to_config(
  c,
  {
    position = 'top',
    max_width = 20,
    enabled_modules = {
      username = true,
      hostname = false,
      cwd = false,
    },
    ansi_colors = {
      active_tab = 3,
      inactive_tab = 1
    }
  }
)

wezterm.on("update-right-status", function(window, pane)
  if utils.is_tmux(pane) then
    wezterm.log_info("Tmux pane detected, disabling WezTerm keys")
    window:set_config_overrides({
      keys = keys.tmux_session_active,
    })
  else
    wezterm.log_info("Non-tmux pane, enabling WezTerm keys")
    window:set_config_overrides({
      keys = c.keys,
    })
  end
end)

return c
