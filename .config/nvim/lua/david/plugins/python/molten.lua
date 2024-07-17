return {
  "benlubas/molten-nvim",
  version = "^1.0.0",
  dependencies = { "3rd/image.nvim" },
  build = ":UpdateRemotePlugins",
  init = function()
    if vim.env.TERM == "xterm-kitty" then
      vim.g.molten_image_provider = "image.nvim"
    end
    vim.g.molten_output_win_max_height = 80
  end,

}
