local wezterm = require 'wezterm'

local ssh_domains = {}

for host, config in pairs(wezterm.enumerate_ssh_hosts()) do
  table.insert(ssh_domains, {
    name = host,
    remote_address = host,
    --assume_shell = 'Posix',
  })
end

return {
  ssh_domains = ssh_domains,
}
