return {
  "folke/twilight.nvim",
  keys = {
    { "<leader>tw", "<cmd>Twilight<cr>", desc = "Twilight" },
  },
  opts = {
    dimming = {
      alpha = 0.55,
      color = { "Normal", "#ffffff" },
      term_bg = "#000000",
      inactive = false,
    },
    context = 10,
    treesitter = true,
    expand = {
      "function",
    },
    exclude = {},

  }
}
