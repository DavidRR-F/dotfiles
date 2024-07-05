return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        config = function()
          require("catppuccin").setup({
            flavour = "frappe",
            background = {
              light = "latte",
              dark = "frappe",
            },
            transparent_background = true,
            show_end_of_buffer = false,
            term_colors = false,
            dim_inactive = {
              enabled = false,
              shade = "dark",
              percentage = 0.15,
            },
            no_italic = false,
            no_bold = false,
            no_underline = false,
            styles = {
              comments = { "italic" },
              conditionals = { "italic" },
              loops = {},
              functions = {},
              keywords = {},
              strings = {},
              variables = {},
              numbers = {},
              booleans = {},
              properties = {},
              types = {},
              operators = {},
            },
            color_overrides = {},
            custom_highlights = {},
            default_integrations = true,
            integrations = {
              cmp = true,
              gitsigns = true,
              nvimtree = true,
              treesitter = true,
              harpoon = true,
              noice = true,
              mini = {
                enabled = true,
                indentscope_color = "",
              },
            },
          })
          vim.cmd.colorscheme "catppuccin"
        end,
      
      },
      {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
        config = function()
          require("nvim-treesitter.configs").setup({
            ensure_installed = {
              "python",
              "html",
              "css",
              "bash",
              "lua",
              "json",
              "xml",
              "yaml",
              "markdown",
              "markdown_inline",
            },
            sync_install = false,
            highlight = {
              enable = true,
              additional_vim_regex_highlighting = false,
            },
            indent = {
              enable = true,
            },
          })
        end,
      },
      {
        "nvim-treesitter/nvim-treesitter-context",
        config = function()
          require("treesitter-context").setup({
            enable = true,
            max_lines = 0,
            min_window_height = 0,
            line_numbers = true,
            multiline_threshold = 20,
            trim_scope = 'outer',
            mode = 'cursor',
            separator = nil,
            zindex = 20,
            on_attach = nil,
          })
        end,
      },
      {
        "brenoprata10/nvim-highlight-colors",
        config = function()
          require("nvim-highlight-colors").setup({})
        end,
      }
}