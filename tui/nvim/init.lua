require("david.core")
require("david.lazy")

local function run_ctags()
    local project_dir = vim.fn.expand('%:p:h')
    local project_name = vim.fn.fnamemodify(project_dir, ':p:h:t')
    local tags_dir = vim.fn.expand(vim.fn.stdpath('cache'), '/.ctags/' .. project_name)
    if vim.fn.isdirectory(tags_dir) == 1 then
      local tags_file = tags_dir .. '/tags'
      local exclude_dirs = {"node_modules", ".git", ".venv"}
      local exclude_patterns = {}
      for _, dir in ipairs(exclude_dirs) do
          table.insert(exclude_patterns, "--exclude=" .. dir)
      end

      local exclude_options = table.concat(exclude_patterns, " ")
      local ctags_command = 'ctags -R -f ' .. tags_file .. ' ' .. exclude_options .. ' ' .. project_dir

      vim.fn.system(ctags_command)

      vim.opt.tags:prepend(tags_file)
    end
end

vim.api.nvim_create_user_command('CreateCtags', function(opts) 
    local project_dir = vim.fn.expand('%:p:h')
    local project_name = vim.fn.fnamemodify(project_dir, ':p:h:t')
    local tags_dir = vim.fn.expand(vim.fn.stdpath('cache'), '/.ctags/' .. project_name)
    vim.fn.mkdir(tags_dir, "p") 
    run_ctags()
end, { nargs = 0 })


vim.api.nvim_create_autocmd("BufEnter", {
    pattern = "*",
    callback = function()
        if vim.fn.isdirectory(vim.fn.expand('%:p:h')) then
            run_ctags()
        end
    end
})

vim.api.nvim_create_autocmd({"BufWritePost", "BufDelete"}, {
    pattern = "*",
    callback = run_ctags
})

vim.api.nvim_create_autocmd('BufEnter', {
  desc = 'Auto Activate Venv on Buffer Enter',
  pattern = '*.py',
  callback = function()  
    local os = require('david.custom.os')
    local venv = vim.fn.findfile('pyproject.toml', vim.fn.getcwd() .. ';')
    if venv ~= '' then
      vim.cmd('CreateCtags')
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
