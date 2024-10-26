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
  { import = "david.plugins.code.python" },
  { import = "david.plugins.color" },
  { import = "david.plugins.git" },
  { import = "david.plugins.gui" },
  { import = "david.plugins.gui.nav" }
}

require("lazy").setup(plugins, {
  checker = {
    enabled = true,
    notify = false,
  },
  change_detection = {
    notify = false,
  }
})
