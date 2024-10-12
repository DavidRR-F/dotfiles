local wezterm = require 'wezterm'

local direction_keys = {
  Left = "h",
  Down = "j",
  Up = "k",
  Right = "l",
  h = "Left",
  j = "Down",
  k = "Up",
  l = "Right",
}

local function is_vim(pane)
  return pane:get_user_vars().IS_NVIM == 'true'
end

local M = {}

local editors = {
  "nvim",
}

M.is_windows = package.config:sub(1, 1) == "\\"

M.basename = function(path) -- get filename from path
  if type(path) ~= "string" then
    return nil
  end
  if M.is_windows then
    return path:gsub("(.*[/\\])(.*)", "%2") -- replace (path/ or path\)(file) with (file)
  else
    return path:gsub("(.*/)(.*)", "%2")
  end -- replace (path/)(file)          with (file)
end

M.is_an_editor = function(name)
  if type(name) ~= "string" then
    return nil
  end
  for _, editor in pairs(editors) do
    if name == editor then
      return true
    end
    if name == editor .. ".exe" then
      return true
    end
  end
  return false
end

M.get_shell_type = function(pane)
  local env = pane:get_user_vars()

  if env.SHELL then
    if env.SHELL:find("zsh") then
      return "Zsh"
    elseif env.SHELL:find("bash") then
      return "Bash"
    elseif env.SHELL:find("fish") then
      return "Fish"
    elseif env.SHELL:find("sh") then
      return "Sh"
    end
  end

  if env.PSModulePath then
    return "PowerShell"
  end

  if env.WSL_DISTRO_NAME then
    return "WSL"
  end

  return "Unknown"
end

M.is_tmux = function(pane)
  return pane:get_user_vars().WEZTERM_IN_TMUX == "1"
end

M.split_nav = function(resize_or_move, key)
  return {
    key = key,
    mods = resize_or_move == 'resize' and 'CTRL|SHIFT' or 'CTRL',
    action = wezterm.action_callback(function(win, pane)
      if is_vim(pane) then
        win:perform_action({
          SendKey = { key = key, mods = resize_or_move == 'resize' and 'CTRL|SHIFT' or 'CTRL' },
        }, pane)
      else
        if resize_or_move == 'resize' then
          win:perform_action({ AdjustPaneSize = { direction_keys[key], 3 } }, pane)
        else
          win:perform_action({ ActivatePaneDirection = direction_keys[key] }, pane)
        end
      end
    end),
  }
end

return M
