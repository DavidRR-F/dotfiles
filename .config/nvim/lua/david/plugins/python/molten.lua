return {
  "benlubas/molten-nvim",
  version = "^1.0.0",
  dependencies = { "3rd/image.nvim" },
  build = ":UpdateRemotePlugins",
  init = function()
    local term = require("david.custom.terminal")
    if term.is_kitty_terminal() then
      vim.g.molten_image_provider = "image.nvim"
    elseif term.is_wezterm_terminal() then
      vim.g.molten_image_provider = "wezterm"
    end
    vim.g.molten_output_win_max_height = 80
  end,

}
