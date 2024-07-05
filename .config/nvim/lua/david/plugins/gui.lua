return {
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons', "Mofiqul/vscode.nvim" },
        config = function()
          require('lualine').setup {
            options = {
              theme = 'cartpuccin',
              component_separators = '|',
              section_separators = { left = '', right = '' },
            },
            sections = {
              lualine_a = {
                { 'mode', separator = { left = '' }, right_padding = 2 },
              },
              lualine_b = { 'filename', 'branch' },
              lualine_c = { 'fileformat' },
              lualine_x = {},
              lualine_y = { 'filetype', 'progress' },
              lualine_z = {
                { 'location', separator = { right = '' }, left_padding = 2 },
              },
            },
            inactive_sections = {
              lualine_a = { 'filename' },
              lualine_b = {},
              lualine_c = {},
              lualine_x = {},
              lualine_y = {},
              lualine_z = { 'location' },
            },
            tabline = {},
            extensions = {},
          }
        end
      },
      {
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
            lsp = {
              override = {
                ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                ["vim.lsp.util.stylize_markdown"] = true,
                ["cmp.entry.get_documentation"] = true,
              },
            },
            presets = {
              bottom_search = true,
              command_palette = true,
              long_message_to_split = true,
              inc_rename = false,
              lsp_doc_border = true,
            },
            views = {
              cmdline_popup = {
                position = {
                  row = 5,
                  col = "50%",
                },
                size = {
                  width = 60,
                  height = "auto",
                },
              },
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
                  find = "utils.lua",
                },
                opts = { skip = true },
              },
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
                  kind = "error",
                  find = "LspProgress",
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
              view = "cmdline_popup",
              format = {
                opts = {},
                cmdline = {
                  pattern = "^:",
                  icon = " ",
                  lang = "vim",
                  opts = {
                    position = "50%",
                    row = "50%",
                    border = "rounded",
                  },
                },
                search_down = { kind = "search", pattern = "^/", icon = " ", lang = "regex" },
                search_up = { kind = "search", pattern = "^%?", icon = " ", lang = "regex" },
                filter = { pattern = "^:%s*!", icon = "$", lang = "bash" },
                lua = { pattern = { "^:%s*lua%s+", "^:%s*lua%s*=%s*", "^:%s*=%s*" }, icon = "", lang = "lua" },
                help = { pattern = "^:%s*he?l?p?%s+", icon = "" },
                input = {},
              },
            },
          })
        end
      },
      {
        'mg979/vim-visual-multi',
        branch = 'master',
        config = function()
          vim.g.VM_maps = {
            ['Find Under'] = '<C-n>',
            ['Find Subword Under'] = '<C-n>'
          }
        end
      },
      {
        'kevinhwang91/nvim-ufo',
        dependencies = 'kevinhwang91/promise-async',
        config = function()
          require('ufo').setup({
            provider_selector = function(bufnr, filetype, buftype)
              return { 'treesitter' }
            end
          })
          vim.api.nvim_set_hl(0, 'UfoFoldedEllipsis', { fg = '#1e88e5' })
        end
      }
}