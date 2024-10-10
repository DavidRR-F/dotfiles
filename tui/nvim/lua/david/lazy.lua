local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
vim.opt.termguicolors = true
local plugins = {
  { import = "david.plugins.code" },
  { import = "david.plugins.code.lsp" },
  { import = "david.plugins.code.ai" },
  { import = "david.plugins.color" },
  { import = "david.plugins.git" },
  { import = "david.plugins.gui" },
  { import = "david.plugins.gui.nav" }
}

local terminal = require("david.custom.terminal")

if terminal.is_wezterm_terminal() then
  table.insert(plugins, 1, { import = "david.plugins.gui.term.wezterm" })
end

require("lazy").setup(plugins, {
  checker = {
    enabled = true,
    notify = false,
  },
  change_detection = {
    notify = false,
  }
})
