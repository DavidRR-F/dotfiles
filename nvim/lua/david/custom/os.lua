local M = {}

M.settings = {
  python_exe = vim.loop.os_uname().sysname == "Window_NT" and "/Scripts/python.exe" or "/bin/python",
  python_host = vim.loop.os_uname().sysname == "Window_NT" and vim.fn.expand('$HOME') .. "/.uv/virtualenvs/neovim3/Scripts/python.exe" or vim.fn.expand('$HOME') .. "/.uv/virtualenvs/neovim3/bin/python" 
}

function M.shell()
  local home_dir = vim.fn.expand("$HOME")
  local sysname = vim.loop.os_uname().sysname
  if sysname == "Windows_NT" then

    local powershell_options = {
      shell = vim.fn.executable "pwsh" == 1 and "pwsh" or "powershell",
      shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;",
      shellredir = "-RedirectStandardOutput %s -NoNewWindow -Wait",
      shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode",
      shellquote = "",
      shellxquote = "",
    }

    for option, value in pairs(powershell_options) do
      vim.opt[option] = value
    end

  end
  if sysname == "Linux" then
    vim.opt.shell = home_dir .. "/bin/bash"
    vim.g.python3_host_prog = home_dir .. "/.uv/virtualenvs/neovim3/bin/python"  
  end
end

return M
