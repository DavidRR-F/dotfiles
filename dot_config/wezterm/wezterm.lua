local wezterm = require 'wezterm'
local appearance = require 'lua.appearance'
local keys = require 'lua.keys'

-- config

local c = {}
if wezterm.config_builder then
  c = wezterm.config_builder()
end
c.default_prog = { "zsh" }
c.default_workspace = "main"
c.disable_default_key_bindings = true
c.enable_wayland = false
c.leader = keys.leader
c.keys = keys.general

appearance.apply_to_config(c)

-- plugins

local plugin_config = require 'lua.plugin_config'
local tabline = wezterm.plugin.require("https://github.com/michaelbrusegard/tabline.wez")
local smart_workspace = wezterm.plugin.require("https://github.com/MLFlexer/smart_workspace_switcher.wezterm")
local smart_splits = wezterm.plugin.require('https://github.com/mrjones2014/smart-splits.nvim')
local smart_ssh = wezterm.plugin.require('https://github.com/DavidRR-F/smart_ssh.wezterm')

smart_splits.apply_to_config(c, plugin_config.smart_splits)
smart_workspace.apply_to_config(c)
smart_ssh.apply_to_config(c)
tabline.setup(plugin_config.tabline)

return c
