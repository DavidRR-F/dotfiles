local wez = require "wezterm"
local scheme = wez.color.get_builtin_schemes()["Catppuccin Mocha"]
local bg = "rgba(30, 30, 46, 0.9)"

local M = {}

local mode_icons = {
  NO = '', -- Normal Mode
  CO = '', -- Visual Mode
  SE = '', -- Search Mode
  WI = '󱀦', -- Window Mode
  SW = '', -- Switch Mode
}

M.config = {
  options = {
    icons_enabled = true,
    theme = 'Catppuccin Mocha',
    color_overrides = {
      normal_mode = {
        a = { fg = scheme.ansi[5], bg = bg },
        b = { fg = scheme.ansi[5], bg = bg },
      },
      copy_mode = {
        a = { fg = scheme.ansi[4], bg = bg },
        b = { fg = scheme.ansi[4], bg = bg },
      },
      search_mode = {
        a = { fg = scheme.ansi[3], bg = bg },
        b = { fg = scheme.ansi[3], bg = bg },
      },
      -- Defining colors for a new key table
      window_mode = {
        a = { fg = '#cba6f7', bg = bg },
        b = { fg = '#cba6f7', bg = bg },
      },
      tab = {
        active = {
          bg = bg,
          fg = scheme.ansi[3],
        },
        inactive = {
          bg = bg,
          fg = scheme.ansi[1],
        },
        inactive_hover = {
          bg = bg,
          fg = scheme.ansi[2],
        }
      }
    },
    section_separators = '',
    component_separators = '',
    tab_separators = '',
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
      'tab_index',
      { 'cwd',    padding = { left = 0, right = 1 } },
      { 'zoomed', padding = 0 },
    },
    tab_inactive = { 'tab_index', { 'process', padding = { left = 0, right = 1 } } },
    tabline_x = {},
    tabline_y = {
      'battery',
      {
        'datetime',
        style = '%H:%M',
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
        padding = { left = 1, right = 0 },
      }
    },
    tabline_z = {},
  },
  extensions = {},
}

return M
