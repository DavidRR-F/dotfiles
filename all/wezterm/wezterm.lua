local wezterm = require 'wezterm'
local appearance = require 'lua.appearance'
local font = require 'lua.font'
local keys = require 'lua.keys'
local plugin_config = require 'lua.plugin_config'
local smart_workspace = wezterm.plugin.require("https://github.com/MLFlexer/smart_workspace_switcher.wezterm")
local smart_splits = wezterm.plugin.require('https://github.com/mrjones2014/smart-splits.nvim')
local quick_domains = wezterm.plugin.require("https://github.com/DavidRR-F/quick_domains.wezterm")

-- config

local c = {}
if wezterm.config_builder then
  c = wezterm.config_builder()
end
c.default_prog = { os.getenv("HOME") .. "/.nix-profile/bin/nu" }
c.default_workspace = "main"
c.disable_default_key_bindings = true
c.enable_wayland = false
c.leader = keys.leader
c.keys = keys.general
c.launch_menu = {
  { label = "󱃾 K9S", args = { "k9s" } },
  { label = "󰻫 Yazi", args = { "yazi" } },
  { label = "󰊢 Lazy Git", args = { "lazygit" } },
  { label = " Lazy Docker", args = { "lazydocker" } },
}

appearance.apply_to_config(c)
font.apply_to_config(c)

-- plugins

quick_domains.apply_to_config(c, plugin_config.quick_domains)
smart_splits.apply_to_config(c, plugin_config.smart_splits)
smart_workspace.apply_to_config(c)

return c
