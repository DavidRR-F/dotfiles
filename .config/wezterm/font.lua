local wez = require "wezterm"

local M = {}

M.apply_to_config = function(c)
  c.font = wez.font("0xProto Nerd Font Mono", { weight = "Regular" })
  c.font_size = 14
  c.adjust_window_size_when_changing_font_size = false
end

return M
