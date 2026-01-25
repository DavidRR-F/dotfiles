local wezterm = require 'wezterm'
local appearance = require 'lua.appearance'
local font = require 'lua.font'
local keys = require 'lua.keys'
local plugin_config = require 'lua.plugin_config'
local smart_workspace = wezterm.plugin.require("https://github.com/MLFlexer/smart_workspace_switcher.wezterm")
local smart_splits = wezterm.plugin.require('https://github.com/mrjones2014/smart-splits.nvim')
local smart_ssh = wezterm.plugin.require('https://github.com/DavidRR-F/smart_ssh.wezterm')

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

local ssh_domains = {}
for host, _ in pairs(wezterm.enumerate_ssh_hosts()) do
  table.insert(ssh_domains, {
    name = host,
    remote_address = host,
    multiplexing = "None",
    assume_shell = 'Posix',
  })
end
c.ssh_domains = ssh_domains

appearance.apply_to_config(c)
font.apply_to_config(c)

-- plugins

smart_splits.apply_to_config(c, plugin_config.smart_splits)
smart_workspace.apply_to_config(c)
smart_ssh.apply_to_config(c)

return c
