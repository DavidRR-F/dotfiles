return {
  "folke/noice.nvim",
  event = "VeryLazy",
  dependencies = {
   "MunifTanjim/nui.nvim",
  },
  config = function()
    require("noice").setup({
      presets = {
        bottom_search = true,
        command_palette = true,
      },
      commands = {
        history = {
          view = "split",
          opts = { enter = false, format = "details" },
        },
      },
      notify = {
        enabled = false,
        view = "notify",
      },
      cmdline = {
        enabled = true,
        view = "cmdline",
        format = {
          opts = {},
          cmdline = {
            pattern = "^:",
            icon = " ",
            lang = "vim"
          },
          search_down = { kind = "search", pattern = "^/", icon = "  ", lang = "regex" },
          search_up = { kind = "search", pattern = "^%?", icon = "  ", lang = "regex" },
          filter = { pattern = "^:%s*!", icon = " $", lang = "bash" },
          lua = { pattern = { "^:%s*lua%s+", "^:%s*lua%s*=%s*", "^:%s*=%s*" }, icon = " ", lang = "lua" },
          help = { pattern = "^:%s*he?l?p?%s+", icon = " " },
          input = {},
        },
      },
    })
  end
}
