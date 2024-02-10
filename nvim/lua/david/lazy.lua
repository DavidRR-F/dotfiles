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
  { import = "david.plugins" },
  {"Mofiqul/vscode.nvim"},
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
