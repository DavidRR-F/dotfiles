local M = {}

function M.get_os_settings()
  local home_dir = vim.fn.expand("$HOME")
  local sysname = vim.loop.os_uname().sysname
  if sysname == "Windows_NT" then
    return {
      python_host = home_dir .. "/.pyenv/pyenv-win/versions/neovim3/Scripts/python",
    }
  end
  if sysname == "Linux" then
    return {
      python_host = home_dir .. "/.pyenv/versions/neovim3/bin/python",
    }
  end
end

return M
