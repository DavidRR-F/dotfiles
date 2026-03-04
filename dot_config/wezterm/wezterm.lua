local wezterm = require 'wezterm'
local appearance = require 'lua.appearance'
local plugins = require 'lua.plugins'
local keys = require 'lua.keys'

--- @class _Wezterm
local _Wezterm = {}
if wezterm.config_builder then
  _Wezterm = wezterm.config_builder()
end
_Wezterm.default_prog = { "zsh" }
_Wezterm.default_workspace = "main"
_Wezterm.disable_default_key_bindings = true
_Wezterm.enable_wayland = false
_Wezterm.leader = keys.leader
_Wezterm.keys = keys.general

appearance.apply_to_config(_Wezterm)
plugins.apply_to_config(_Wezterm)

return _Wezterm
