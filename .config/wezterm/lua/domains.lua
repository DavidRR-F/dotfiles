local wez = require "wezterm"

local M = {}

local ssh_domains_path = os.getenv("HOME") .. "/.config/wezterm/ssh.lua"
local ok, ssh = pcall(dofile, ssh_domains_path)

M.apply_to_config = function(c)
  if ok and type(ssh) == "table" then
    c.ssh_domains = ssh
  else
    wez.log_info("SSH domains file not found or invalid: " .. ssh_domains_path)
  end
end

return M
