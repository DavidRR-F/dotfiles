require("david.core")
require("david.lazy")
vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'Auto select virtualenv pyright starts',
  pattern = '*',
  callback = function()  
    local os = require('david.custom.os')
    local venv = vim.fn.findfile('pyproject.toml', vim.fn.getcwd() .. ';')
    if venv ~= '' then
      local python_path = vim.fn.getcwd() .. '/.venv' .. os.get_os_settings().python_exe
      require("venv-selector").activate_from_path(python_path)
      print("pyright activated with cwd venv")
    end
  end,
  once = true,
})
