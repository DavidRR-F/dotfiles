require("david.core")
require("david.lazy")

vim.api.nvim_create_autocmd('BufEnter', {
  desc = 'Auto Activate Venv on Buffer Enter',
  pattern = '*.py',
  callback = function()  
    local os = require('david.custom.os')
    local venv = vim.fn.findfile('pyproject.toml', vim.fn.getcwd() .. ';')
    if venv ~= '' then
      local python_path = vim.fn.getcwd() .. '/.venv' .. os.get_os_settings().python_exe
      local selector = require("venv-selector")
      if selector.venv() ~= python_path then 
        require("venv-selector").activate_from_path(python_path)
        print("Venv Activated")
      end
    end
  end,
  once = true,
})
