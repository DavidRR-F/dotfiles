local M = {}

function M.is_kitty_terminal()
  return vim.loop.os_getenv("KITTY_WINDOW_ID") ~= nil
end

function M.is_tmux_session()
  return vim.loop.os_getenv("TMUX") ~= nil
end

function M.is_kitty_in_tmux()
  return M.is_kitty_terminal() and M.is_tmux_session()
end

function M.is_wezterm_terminal()
  return vim.loop.os_getenv("WEZTERM_EXECUTABLE") ~= nil
end

function M.is_wezterm_in_tmux()
  return M.is_wezterm_terminal() and M.is_tmux_session()
end

return M
