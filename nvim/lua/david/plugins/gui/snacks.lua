return {
 "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  keys = {
    { "<leader>.",  function() Snacks.scratch() end, desc = "Toggle Scratch Buffer" },
    { "<leader>S",  function() Snacks.scratch.select() end, desc = "Select Scratch Buffer" },
    { "<leader>n",  function() Snacks.notifier.show_history() end, desc = "Notification History" },
    { "<leader>cR", function() Snacks.rename.rename_file() end, desc = "Rename File" },
    { "<leader>gB", function() Snacks.gitbrowse() end, desc = "Git Browse" },
    { "<leader>gb", function() Snacks.git.blame_line() end, desc = "Git Blame Line" },
    { "<leader>un", function() Snacks.notifier.hide() end, desc = "Dismiss All Notifications" },
    { "<leader>t",  function() Snacks.terminal() end, desc = "Toggle Terminal" }
  },
  opts = {
    dashboard = {
      enabled = true,
      preset = {
        header = [[  
  ____                _ _____ _          ____                  
|  _ \ ___  __ _  __| |_   _| |__   ___|  _ \  ___   ___ ___
| |_) / _ \/ _` |/ _` | | | | '_ \ / _ \ | | |/ _ \ / __/ __|
|  _ <  __/ (_| | (_| | | | | | | |  __/ |_| | (_) | (__\__ \
 |_| \_\___|\__,_|\__,_| |_| |_| |_|\___|____/ \___/ \___|___/ ]],
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
            action = function() require('telescope.builtin').find_files() end
          },
          {
            text = {
              { "󰍒  ", hl = "Title" },
              { "Find Mark", hl = "SnacksDashboardDesc", width = 55 },
              { "[m]", hl = "SnacksDashboardKey" },
            },
            key = 'm',
            action = function() require('telescope.builtin').marks() end
          },
          {
            text = {
              { "󱈆  ", hl = "Title" },
              { "Find Worktree", hl = "SnacksDashboardDesc", width = 55 },
              { "[w]", hl = "SnacksDashboardKey" },
            },
            key = 'w',
            action = function() require('telescope').extensions.git_worktree.git_worktrees() end
          },
          {
            text = {
              { "󰷊  ", hl = "Title" },
              { "File Explorer", hl = "SnacksDashboardDesc", width = 55 },
              { "[e]", hl = "SnacksDashboardKey" },
            },
            key = 'e',
            action = function() vim.cmd('Ex') end
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
          { section = "keys", gap = 1, padding = 1 },
          { section = "startup" },
        },
      }
    },
    notifier = {enabled = true},
    quickfile = {enabled = true},
    gitbrowse = {enabled = true},
    terminal = {enabled = true},
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
