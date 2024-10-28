return {
  'nvimdev/dashboard-nvim',
  event = 'VimEnter',
  config = function()
    require('dashboard').setup {
      theme = 'doom',
      config = {
        header = {
          [[                                                               ]],
          [[                                                               ]],
          [[                                                               ]],
          [[                                                               ]],
          [[                                                               ]],
          [[                                                               ]],
          [[  ____                _ _____ _          ____                  ]],
          [[ |  _ \ ___  __ _  __| |_   _| |__   ___|  _ \  ___   ___ ___  ]],
          [[ | |_) / _ \/ _` |/ _` | | | | '_ \ / _ \ | | |/ _ \ / __/ __| ]],
          [[ |  _ <  __/ (_| | (_| | | | | | | |  __/ |_| | (_) | (__\__ \ ]],
          [[ |_| \_\___|\__,_|\__,_| |_| |_| |_|\___|____/ \___/ \___|___/ ]],
          [[                                                               ]],
          [[                                                               ]],
          [[                                                               ]],
          [[                                                               ]],
        },
        center = {
          {
            icon = '󰱼 ',
            icon_hl = 'Title',
            desc = 'Find File',
            desc_hl = 'String',
            key = 'f',
            keymap = 'leader ff',
            key_hl = 'Number',
            key_format = ' %s', 
            action = function() require('telescope.builtin').find_files() end
          },
          {
            icon = '󱤇 ',
            icon_hl = 'Title',
            desc = 'Find Tags',
            desc_hl = 'String',
            key = 't',
            keymap = 'leader ft',
            key_format = ' %s', 
            action = function() require('telescope.builtin').tags() end
          },
          {
            icon = '󰍒 ',
            icon_hl = 'Title',
            desc = 'Find Marks',
            desc_hl = 'String',
            key = 't',
            keymap = 'leader fm',
            key_format = ' %s', 
            action = function() vim.cmd("Telescope marks") end
          },
          {
            icon = '󰷊 ',
            icon_hl = 'Title',
            desc = 'File Explorer',
            desc_hl = 'String',
            key = 'e',
            keymap = 'leader fe',
            key_format = ' %s', 
            action = function() vim.cmd('Ex') end
          },
          {
            icon = '󰈆 ',
            icon_hl = 'Title',
            desc = 'Quit',
            desc_hl = 'String',
            key = 'q',
            keymap = ':q',
            key_format = ' %s', 
            action = function() vim.cmd('qa') end
          },
        },
        footer = {"", "", "Do Math"},
      }
    }
  end,
  dependencies = { {'nvim-tree/nvim-web-devicons'}}
}
