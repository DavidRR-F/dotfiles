local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
vim.opt.termguicolors = true
local plugins = {
  {"chr4/nginx.vim"},
  { import = "david.plugins.fileconfig" },
  { import = "david.plugins.colorconfig" },
  { import = "david.plugins.colorconfig.csstools" },
  { import = "david.plugins.lspconfig" },
  { import = "david.plugins.debugconfig" },
  { import = "david.plugins.hubconfig" },
  { import = "david.plugins.formatconfig" },
  { import = "david.plugins.notebookconfig" },
  { import = "david.plugins.dbconfig" },
  { import = "david.plugins.markdownconfig" }, 
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
