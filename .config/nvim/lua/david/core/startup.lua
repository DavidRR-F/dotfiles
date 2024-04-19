local function activate_venv()
  local is_windows = vim.fn.has('win32') == 1
  local venv_file = '.venv'
  local path_sep = is_windows and '\\' or '/'
  local bin_dir = is_windows and 'Scripts' or 'bin'
  
  if vim.fn.filereadable(venv_file) == 1 then
    local venv_path = vim.fn.trim(vim.fn.system('cat ' .. venv_file))
    local python_bin_path = venv_path .. path_sep .. bin_dir
    
    if is_windows then
      -- For Windows, especially if using PowerShell
      vim.env.Path = python_bin_path .. ';' .. vim.env.Path
      vim.g.python3_host_prog = python_bin_path .. path_sep .. 'python.exe'
    else
      -- For Unix-like systems (Bash, Zsh, etc.)
      vim.env.PATH = python_bin_path .. ':' .. vim.env.PATH
      vim.g.python3_host_prog = python_bin_path .. path_sep .. 'python'
    end
  end
end

vim.api.nvim_create_autocmd("DirChanged", {
    pattern = "*",
    callback = activate_venv,
})

