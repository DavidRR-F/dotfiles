local wez = require "wezterm"

local M = {}
-- The Font rules are being applied here.
M.apply_to_config = function(c)
  c.font = wez.font { family = "{{ font }}", weight = "Regular" }
  c.font_size = {{ font_size }}
  c.font_rules = {
    {
      intensity = "Normal",
      italic = true,
      font = wez.font { family = "{{ font_italic }}", weight = "Regular", italic = true, harfbuzz_features = { "ss01" } }
    }
  }
  c.adjust_window_size_when_changing_font_size = false
end

return M
