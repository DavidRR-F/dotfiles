return {
  "folke/noice.nvim",
  event = "VeryLazy",
  opts = {
    -- add any options here
  },
  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
  },
  config = function()
    require("noice").setup({
      presets = {
        bottom_search = true,
        command_palette = true,
        long_message_to_split = false,
        inc_rename = true,
        lsp_doc_border = false,
      },
      views = {
        popupmenu = {
          relative = "editor",
          position = {
            row = 8,
            col = "50%",
          },
          size = {
            width = 60,
            height = 10,
          },
          border = {
            style = "rounded",
            padding = { 0, 1 },
          },
          win_options = {
            winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
          },
        },
      },
      commands = {
        history = {
          view = "split",
          opts = { enter = false, format = "details" },
        },
      },
      notify = {
        enabled = true,
        view = "notify",
      },
      routes = {
        {
          filter = {
            event = "msg_show",
            kind = "",
            find = "written",
          },
          opts = { skip = true },
        },
        {
          filter = {
            event = "msg_show",
            kind = "",
            find = "created",
          },
          opts = { skip = true },
        },
        {
          filter = {
            event = "msg_show",
            kind = "",
            find = "removed",
          },
          opts = { skip = true },
        },
        {
          filter = {
            event = "notify",
            kind = "warn",
          },
          opts = { skip = true },
        },
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
