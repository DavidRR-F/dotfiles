return {
  "benlubas/molten-nvim",
  version = "^1.0.0",
  dependencies = { "willothy/image.nvim" },
  build = ":UpdateRemotePlugins",
  init = function()
    vim.g.molten_image_provider = "wezterm.nvim"
    vim.g.molten_output_win_max_height = 80
  end,

}
