local wez = require "wezterm"
local scheme = wez.color.get_builtin_schemes()["Catppuccin Mocha"]

local M = {}

local mode_icons = {
  NO = '', -- Normal Mode
  CO = '', -- Visual Mode
  SE = '', -- Search Mode
  WI = '󱀦', -- Window Mode
  SW = '', -- Switch Mode
  DM = '', -- Domain Mode
  RE = '', -- Resurrect
}

M.tabline = {
  options = {
    icons_enabled = true,
    theme = 'Catppuccin Mocha',
    theme_overrides = {
      normal_mode = {
        a = { fg = scheme.ansi[5], bg = scheme.background },
        b = { fg = scheme.ansi[5], bg = scheme.background },
      },
      copy_mode = {
        a = { fg = scheme.ansi[4], bg = scheme.background },
        b = { fg = scheme.ansi[4], bg = scheme.background },
      },
      search_mode = {
        a = { fg = scheme.ansi[3], bg = scheme.background },
        b = { fg = scheme.ansi[3], bg = scheme.background },
      },
      -- Defining colors for a new key table
      window_mode = {
        a = { fg = scheme.ansi[6], bg = scheme.background },
        b = { fg = scheme.ansi[6], bg = scheme.background },
      },
      tab = {
        active = {
          bg = scheme.background,
          fg = scheme.ansi[3],
        },
        inactive = {
          bg = scheme.background,
          fg = scheme.ansi[2],
        },
        inactive_hover = {
          bg = scheme.background,
          fg = scheme.ansi[6],
        }
      }
    },
    section_separators = '',
    component_separators = '',
    tab_separators = {
      left = '',
      right = '',
    },
  },
  sections = {
    tabline_a = {
      {
        'mode',
        padding = { left = 1, right = 0 },
        fmt = function(str) return mode_icons[str:sub(1, 2)] end
      },
    },
    tabline_b = {
      {
        'workspace',
        icon = '',
        padding = { left = 0, right = 1 },
      }
    },
    tabline_c = {},
    tab_active = {
      'index',
      { 'cwd',    padding = { left = 0, right = 1 } },
      { 'zoomed', padding = 0 },
    },
    tab_inactive = { 'index', { 'cwd', padding = { left = 0, right = 1 } } },
    tabline_x = {},
    tabline_y = {
      'battery',
      {
        'datetime',
        style = '%I:%M',
        hour_to_icon = {
          ['00'] = wez.nerdfonts.md_clock_time_twelve_outline,
          ['01'] = wez.nerdfonts.md_clock_time_one_outline,
          ['02'] = wez.nerdfonts.md_clock_time_two_outline,
          ['03'] = wez.nerdfonts.md_clock_time_three_outline,
          ['04'] = wez.nerdfonts.md_clock_time_four_outline,
          ['05'] = wez.nerdfonts.md_clock_time_five_outline,
          ['06'] = wez.nerdfonts.md_clock_time_six_outline,
          ['07'] = wez.nerdfonts.md_clock_time_seven_outline,
          ['08'] = wez.nerdfonts.md_clock_time_eight_outline,
          ['09'] = wez.nerdfonts.md_clock_time_nine_outline,
          ['10'] = wez.nerdfonts.md_clock_time_ten_outline,
          ['11'] = wez.nerdfonts.md_clock_time_eleven_outline,
          ['12'] = wez.nerdfonts.md_clock_time_twelve,
          ['13'] = wez.nerdfonts.md_clock_time_one,
          ['14'] = wez.nerdfonts.md_clock_time_two,
          ['15'] = wez.nerdfonts.md_clock_time_three,
          ['16'] = wez.nerdfonts.md_clock_time_four,
          ['17'] = wez.nerdfonts.md_clock_time_five,
          ['18'] = wez.nerdfonts.md_clock_time_six,
          ['19'] = wez.nerdfonts.md_clock_time_seven,
          ['20'] = wez.nerdfonts.md_clock_time_eight,
          ['21'] = wez.nerdfonts.md_clock_time_nine,
          ['22'] = wez.nerdfonts.md_clock_time_ten,
          ['23'] = wez.nerdfonts.md_clock_time_eleven,
        },
        padding = { left = 1, right = 1 },
      }
    },
    tabline_z = {},
  },
  extensions = {
    {
      'smart_ssh',
      events = {
        show = 'smart_ssh.fuzzy_selector.opened',
        hide = {
          'smart_ssh.fuzzy_selector.canceled',
          'smart_ssh.fuzzy_selector.selected',
          'smart_workspace_switcher.workspace_switcher.start',
        },
      },
      sections = {
        tabline_a = {
          {
            'mode',
            padding = { left = 1, right = 0 },
            fmt = function(str) return mode_icons['DM'] end
          },
        },
        tabline_b = {
          {
            'workspace',
            icon = '',
            padding = { left = 0, right = 1 },
          }
        },
      },
      colors = {
        a = { fg = scheme.ansi[6], bg = scheme.background },
        b = { fg = scheme.ansi[6], bg = scheme.background },
      },
    },
    {
      'smart_workspace_switcher',
      events = {
        show = 'smart_workspace_switcher.workspace_switcher.start',
        hide = {
          'smart_workspace_switcher.workspace_switcher.canceled',
          'smart_workspace_switcher.workspace_switcher.chosen',
          'smart_workspace_switcher.workspace_switcher.created',
          'smart_ssh.fuzzy_selector.opened',
        },
      },
      sections = {
        tabline_a = {
          {
            'mode',
            padding = { left = 1, right = 0 },
            fmt = function(str) return mode_icons['SW'] end
          },
        },
        tabline_b = {
          {
            'workspace',
            icon = '',
            padding = { left = 0, right = 1 },
          }
        },
      },
      colors = {
        a = { fg = scheme.ansi[2], bg = scheme.background },
        b = { fg = scheme.ansi[2], bg = scheme.background },
      },
    },
  },
}

M.smart_splits = {
  direction_keys = {
    move = { 'h', 'j', 'k', 'l' },
    resize = { 'h', 'j', 'k', 'l' },
  },
  modifiers = {
    move = 'CTRL',
    resize = 'META',
  },
  log_level = 'info',
}

return M
