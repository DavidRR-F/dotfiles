local wezterm = require 'wezterm'
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
c.default_prog = { "{{ shell }}" }
c.default_workspace = "main"
c.disable_default_key_bindings = true
c.enable_wayland = false
c.keys = keys.general
c.key_tables = { tmux = keys.tmux }
c.launch_menu = {
  { label = "󰊢 Lazy Git", args = { "lazygit" } },
  { label = " Lazy Docker", args = { "lazydocker" } },
  { label = "󱃾 K9S", args = { "k9s" } },
  { label = "󰻫 Yazi", args = { "yazi" } },
}

appearance.apply_to_config(c)
font.apply_to_config(c)

-- plugins

quick_domains.apply_to_config(c, plugin_config.quick_domains)
smart_workspace.apply_to_config(c)

return c
