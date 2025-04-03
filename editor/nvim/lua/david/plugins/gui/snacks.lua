return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  keys = {
    { "<leader>.",  function() Snacks.scratch() end,                                        desc = "Toggle Scratch Buffer" },
    { "<leader>S",  function() Snacks.scratch.select() end,                                 desc = "Select Scratch Buffer" },
    { "<leader>N",  function() Snacks.notifier.show_history() end,                          desc = "Notification History" },
    { "<leader>cR", function() Snacks.rename.rename_file() end,                             desc = "Rename File" },
    { "<leader>gB", function() Snacks.gitbrowse() end,                                      desc = "Git Browse" },
    { "<leader>gb", function() Snacks.git.blame_line() end,                                 desc = "Git Blame Line" },
    { "<leader>gl", function() Snacks.lazygit.log() end,                                    desc = "Lazy Git Log" },
    { "<leader>gf", function() Snacks.lazygit.log_file() end,                               desc = "Lazy Git Log Line" },
    { "<leader>un", function() Snacks.notifier.hide() end,                                  desc = "Dismiss All Notifications" },
    { "<leader>t",  function() Snacks.terminal() end,                                       desc = "Toggle Terminal" },
    { "<leader>f",  function() Snacks.picker.files() end,                                   desc = "Find File" },
    { "z=",         function() Snacks.picker.spelling() end,                                desc = "Spell Suggestions" },
    { "<leader>nf", function() Snacks.picker.files({ cwd = "~/notes", search = "md" }) end, desc = "Find Notes" },
    { "<leader>ng", function() Snacks.picker.grep({ cwd = "~/notes" }) end,                 desc = "Grep Notes" },
    { "<leader>g",  function() Snacks.picker.grep() end,                                    desc = "Grep Word" },
    { "<leader>e",  function() Snacks.picker.explorer() end,                                desc = "File Explorer" },
    { "<leader>p",  function() Snacks.picker.projects() end,                                desc = "Find Project" },
    { "<leader>lg", function() Snacks.lazygit.open() end,                                   desc = "Lazy Git" },
    { "<leader>ld", function() Snacks.terminal("lazydocker") end,                           desc = "Lazy Docker" },
  },
  opts = {
    dashboard = {
      enabled = true,
      preset = {
        header = [[
 ____                _ _____ _          ____   (╯°□°）╯︵ ┻━┻
|  _ \ ___  __ _  __| |_   _| |__   ___|  _ \  ___   ___ ___
| |_) / _ \/ _` |/ _` | | | | '_ \ / _ \ | | |/ _ \ / __/ __|
|  _ <  __/ (_| | (_| | | | | | | |  __/ |_| | (_) | (__\__ \
|_| \_\___|\__,_|\__,_| |_| |_| |_|\___|____/ \___/ \___|___/
        ]],
        keys = {
          {
            icon = '󰱼 ',
            text = {
              { "󰱼  ", hl = "Title" },
              { "Find File", hl = "SnacksDashboardDesc", width = 55 },
              { "[f]", hl = "SnacksDashboardKey" },
            },
            desc = 'Find File',
            key = 'f',
            action = function() Snacks.picker.files() end
          },
          {
            text = {
              { "󰷊  ", hl = "Title" },
              { "File Explorer", hl = "SnacksDashboardDesc", width = 55 },
              { "[e]", hl = "SnacksDashboardKey" },
            },
            key = 'e',
            action = function() Snacks.picker.explorer() end
          },
          {
            text = {
              { "󱈆  ", hl = "Title" },
              { "Find Project", hl = "SnacksDashboardDesc", width = 55 },
              { "[p]", hl = "SnacksDashboardKey" },
            },
            key = 'p',
            action = function() Snacks.picker.projects() end
          },
          {
            icon = '󰈆 ',
            text = {
              { "󰈆  ", hl = "Title" },
              { "Quit", hl = "SnacksDashboardDesc", width = 55 },
              { "[q]", hl = "SnacksDashboardKey" },
            },
            key = 'q',
            action = function() vim.cmd('qa') end
          },
        },
        sections = {
          { section = "header" },
          { section = "keys",   gap = 1, padding = 1 },
          { section = "startup" },
        },
      }
    },
    notifier = { enabled = true },
    quickfile = { enabled = true },
    gitbrowse = { enabled = true },
    terminal = { enabled = true },
    lazygit = { enabled = true },
    image = { enabled = true, doc = { enabled = true, inline = true, float = false } },
    picker = {
      sources = {
        grep = {
          finder = "grep",
          regex = true,
          format = "file",
          layout = {
            preset = "dropdown",
          }
        },
        explorer = {
          replace_netrw = true,
          hidden = true,
          layout = { layout = { position = "right" } }
        },
        files = {
          hidden = true,
        },
        projects = {
          layout = {
            preset = "vscode"
          }
        },
      }
    },
    indent = {
      enabled = true,
      hl = "SnacksIndent",
      animate = {
        enabled = false
      },
      scope = {
        enabled = false
      }
    },
    statuscolumn = {
      enabled = true,
      left = { "mark", "sign" },
      right = { "fold", "git" },
      folds = {
        open = true,
        git_hl = false,
      },
      git = {
        patterns = { "GitSign", "MiniDiffSign" },
      },
      refresh = 50,
    }
  }
}
