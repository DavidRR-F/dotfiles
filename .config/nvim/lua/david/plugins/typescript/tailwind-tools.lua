return {
  "luckasRanarison/tailwind-tools.nvim",
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  opts = {
    document_color = {
      enabled = false,
      kind = "inline",
      inline_symbol = "󰝤 ",
      debounce = 200,
    },
    conceal = {
      enabled = true,
      min_length = nil,
      symbol = "󱏿",
      highlight = {
        fg = "#38BDF8",
      },
    }
  }
}
