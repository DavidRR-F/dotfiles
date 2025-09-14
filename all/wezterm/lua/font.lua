local wez = require "wezterm"

local M = {}
M.apply_to_config = function(c)
  c.font = wez.font_with_fallback({
    { family = "0xProto Nerd Font Mono",  weight = "Regular", style = "Normal" },
    { family = "0xProto Nerd Font Propo", weight = "Regular", style = "Normal" },
  })
  c.font_size = 12
  c.adjust_window_size_when_changing_font_size = false
end

return M
