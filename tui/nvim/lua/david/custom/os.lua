local M = {}

function M.get_os_settings()
  local home_dir = vim.fn.expand("$HOME")
  local sysname = vim.loop.os_uname().sysname
  if sysname == "Windows_NT" then
    return {
      python_host = home_dir .. "/.uv/virtualenvs/neovim3/Scripts/python.exe",
      python_exe = "/Scripts/python.exe",
    }
  end
  if sysname == "Linux" then
    return {
      python_host = home_dir .. "/.uv/virtualenvs/neovim3/bin/python",
      python_exe = "/bin/python",
    }
  end
end

return M
