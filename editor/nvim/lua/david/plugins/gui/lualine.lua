local mode_icons = {
  n = '', -- Normal Mode
  i = '󰷫', -- Insert Mode
  v = '', -- Visual Mode
  [''] = '󰈈', -- Visual Block Mode
  V = '󱀦', -- Visual Line Mode
  c = '', -- Command Mode
  no = '', -- Operator-pending Mode
  s = '', -- Select Mode
  S = '', -- Select Line Mode
  [''] = '󱁵', -- Select Block Mode
  R = '', -- Replace Mode
  r = '󰭻', -- Prompt Mode
  ['!'] = '', -- Shell or terminal mode
  t = '', -- Terminal Mode
}

return {
  'nvim-lualine/lualine.nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
    { 'catppuccin/nvim', as = 'catppuccin' },
  },
  config = function()
    local colors = require('catppuccin.palettes').get_palette 'mocha'
    local marks = require('david.custom.marks').lualine_marks
    local function mode_icon(str)
      return mode_icons[vim.fn.mode()] or str
    end
    local function mode_color()
      local color = {
        n = colors.blue,
        i = colors.green,
        v = colors.mauve,
        [''] = colors.mauve,
        V = colors.mauve,
        c = colors.peach,
        no = colors.red,
        s = colors.peach,
        S = colors.peach,
        [''] = colors.peach,
        ic = colors.yellow,
        R = colors.maroon,
        Rv = colors.maroon,
        cv = colors.red,
        ce = colors.red,
        r = colors.cyan,
        rm = colors.cyan,
        ['r?'] = colors.cyan,
        ['!'] = colors.red,
        t = colors.red,
      }
      return { fg = colors.base, bg = colors[vim.fn.mode()] }
    end
    require('lualine').setup {
      theme = 'catppuccin',
      globalstatus = true,
      options = { section_separators = { left = '', right = '' }, component_separators = '', always_show_tabline = false },
      sections = {
        lualine_a = {
          {
            'mode',
            fmt = mode_icon,
            color = mode_color,
            padding = { left = 1, right = 1 },
          },
        },
        lualine_b = {
          {
            'filename',
            path = 0,
            padding = { left = 1, right = 1 },
            symbols = {
              modified = '',
              readonly = '󰈡',
              unnamed = '',
              newfile = '',
            }
          }
        },
        lualine_c = { marks },
        lualine_x = {
          {
            'diff',
            symbols = { added = ' ', modified = ' ', removed = ' ' },
          },
        },
        lualine_y = {
          {
            'branch',
            icon = '󰊢',
            padding = { left = 1, right = 1 },
          }
        },
        lualine_z = {
          {
            'fileformat',
            color = mode_color
          }
        },
      },
      inactive_sections = {
        lualine_a = { 'filename' },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = { 'branch' },
      },
      tabline = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
      },
    }
  end
}
