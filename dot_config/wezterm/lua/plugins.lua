local wezterm = require("wezterm")

local scheme = wezterm.color.get_builtin_schemes()["Catppuccin Mocha"]

local tabline = wezterm.plugin.require("https://github.com/michaelbrusegard/tabline.wez")
local smart_workspace = wezterm.plugin.require("https://github.com/MLFlexer/smart_workspace_switcher.wezterm")
local smart_splits = wezterm.plugin.require('https://github.com/mrjones2014/smart-splits.nvim')
local smart_ssh = wezterm.plugin.require('https://github.com/DavidRR-F/smart_ssh.wezterm')
local bookmarks = wezterm.plugin.require('https://github.com/DavidRR-F/bookmarks.wezterm')

local mode_icons = {
  NO = wezterm.nerdfonts.cod_layers,     -- Normal Mode
  CO = wezterm.nerdfonts.oct_eye,        -- Visual Mode
  SE = wezterm.nerdfonts.oct_search,     -- Search Mode
  WI = wezterm.nerdfonts.oct_eye_closed, -- Window Mode
  SW = wezterm.nerdfonts.cod_arrow_swap, -- Switch Mode
  DM = wezterm.nerdfonts.cod_remote,     -- Domain Mode
}

local configs = {
  smart_splits = {
    direction_keys = {
      move = { 'h', 'j', 'k', 'l' },
      resize = { 'h', 'j', 'k', 'l' },
    },
    modifiers = {
      move = 'CTRL',
      resize = 'META',
    },
    log_level = 'info',
  },
  bookmarks = {
    tabline = {
      enabled = true
    }
  },
  tabline = {
    options = {
      icons_enabled = true,
      theme = 'Catppuccin Mocha',
      theme_overrides = {
        normal_mode = {
          a = { fg = scheme.ansi[5], bg = scheme.tab_bar.inactive_tab.bg_color },
          b = { fg = scheme.ansi[5], bg = scheme.tab_bar.inactive_tab.bg_color },
        },
        copy_mode = {
          a = { fg = scheme.ansi[4], bg = scheme.tab_bar.inactive_tab.bg_color },
          b = { fg = scheme.ansi[4], bg = scheme.tab_bar.inactive_tab.bg_color },
        },
        search_mode = {
          a = { fg = scheme.ansi[3], bg = scheme.tab_bar.inactive_tab.bg_color },
          b = { fg = scheme.ansi[3], bg = scheme.tab_bar.inactive_tab.bg_color },
        },
        -- Defining colors for a new key table
        window_mode = {
          a = { fg = scheme.ansi[6], bg = scheme.tab_bar.inactive_tab.bg_color },
          b = { fg = scheme.ansi[6], bg = scheme.tab_bar.inactive_tab.bg_color },
        },
        tab = {
          active = {
            bg = scheme.background,
            fg = scheme.ansi[3],
          },
          inactive = {
            bg = scheme.tab_bar.inactive_tab.bg_color,
            fg = scheme.tab_bar.active_tab.bg_color,
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
        left = wezterm.nerdfonts.ple_lower_left_triangle,
        right = wezterm.nerdfonts.ple_lower_right_triangle,
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
        { 'cwd',        padding = { left = 1, right = 1 } },
        { 'bookmarked', padding = 0 },
        { 'zoomed',     padding = 0 },
      },
      tab_inactive = {
        { 'cwd',        padding = { left = 1, right = 1 } },
        { 'bookmarked', padding = 0 }
      },
      tabline_x = {},
      tabline_y = {
        'battery',
        {
          'datetime',
          style = '%I:%M',
          hour_to_icon = {
            ['00'] = wezterm.nerdfonts.md_clock_time_twelve_outline,
            ['01'] = wezterm.nerdfonts.md_clock_time_one_outline,
            ['02'] = wezterm.nerdfonts.md_clock_time_two_outline,
            ['03'] = wezterm.nerdfonts.md_clock_time_three_outline,
            ['04'] = wezterm.nerdfonts.md_clock_time_four_outline,
            ['05'] = wezterm.nerdfonts.md_clock_time_five_outline,
            ['06'] = wezterm.nerdfonts.md_clock_time_six_outline,
            ['07'] = wezterm.nerdfonts.md_clock_time_seven_outline,
            ['08'] = wezterm.nerdfonts.md_clock_time_eight_outline,
            ['09'] = wezterm.nerdfonts.md_clock_time_nine_outline,
            ['10'] = wezterm.nerdfonts.md_clock_time_ten_outline,
            ['11'] = wezterm.nerdfonts.md_clock_time_eleven_outline,
            ['12'] = wezterm.nerdfonts.md_clock_time_twelve,
            ['13'] = wezterm.nerdfonts.md_clock_time_one,
            ['14'] = wezterm.nerdfonts.md_clock_time_two,
            ['15'] = wezterm.nerdfonts.md_clock_time_three,
            ['16'] = wezterm.nerdfonts.md_clock_time_four,
            ['17'] = wezterm.nerdfonts.md_clock_time_five,
            ['18'] = wezterm.nerdfonts.md_clock_time_six,
            ['19'] = wezterm.nerdfonts.md_clock_time_seven,
            ['20'] = wezterm.nerdfonts.md_clock_time_eight,
            ['21'] = wezterm.nerdfonts.md_clock_time_nine,
            ['22'] = wezterm.nerdfonts.md_clock_time_ten,
            ['23'] = wezterm.nerdfonts.md_clock_time_eleven,
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
              fmt = function(_) return mode_icons['DM'] end
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
              fmt = function(_) return mode_icons['SW'] end
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
}

--- @class _Plugins
local _Plugins = {}

function _Plugins.apply_to_config(c)
  smart_splits.apply_to_config(c, configs.smart_splits)
  smart_workspace.apply_to_config(c)
  smart_workspace.get_choices = function(opts)
    return smart_workspace.choices.get_workspace_elements({})
  end
  smart_ssh.apply_to_config(c)
  bookmarks.apply_to_config(c, configs.bookmarks)
  tabline.setup(configs.tabline)
end

return _Plugins
