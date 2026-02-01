return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
  {
    "catppuccin/nvim",
    as = "catppuccin",
    name = "catppuccin",
    priority = 1000,
    opts = {
      flavour = "mocha",
      background = {
        light = "latte",
        dark = "mocha",
      },
      transparent_background = true,
      show_end_of_buffer = false,
      term_colors = true,
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
        conditionals = {},
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
      custom_highlights = {
        CursorLineNr = { fg = require("catppuccin.palettes.mocha").yellow },
        SnacksIndent = { fg = require("catppuccin.palettes.mocha").surface0 },
      },
      default_integrations = true,
      integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        treesitter = true,
        harpoon = true,
        noice = true,
        telescope = true,
        mini = {
          enabled = true,
          indentscope_color = "",
        },
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    init = function()
      require("vim.treesitter.query").add_predicate("is-mise?", function(_, _, bufnr, _)
        local filepath = vim.api.nvim_buf_get_name(tonumber(bufnr) or 0)
        local filename = vim.fn.fnamemodify(filepath, ":t")
        return string.match(filename, ".*mise.*%.toml$") ~= nil
      end, { force = true, all = false })
    end,
    opts = {
      ensure_installed = {
        "bash",
        "html",
        "javascript",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "go",
        "dockerfile",
        "regex",
        "tsx",
        "typescript",
        "vim",
        "yaml",
        "hcl",
        "gitignore",
        "helm",
        "toml",
        "zsh",
        "vimdoc"
      },
    },
  },
  { "alker0/chezmoi.vim" },
  {
    'xvzc/chezmoi.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require("chezmoi").setup {
        edit = {
          watch = false,
          force = false,
          ignore_patterns = {
            "run_onchange_.*",
            "run_once_.*",
            "%.chezmoiignore",
            "%.chezmoitemplate",
          },
        },
        events = {
          on_open = {
            notification = {
              enable = true,
              msg = "Opened a chezmoi-managed file",
              opts = {},
            },
          },
          on_watch = {
            notification = {
              enable = true,
              msg = "This file will be automatically applied",
              opts = {},
            },
          },
          on_apply = {
            notification = {
              enable = true,
              msg = "Successfully applied",
              opts = {},
            },
          },
        },
      }
    end
  },
  {
    "jmbuhr/otter.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      vim.api.nvim_create_autocmd({ "FileType" }, {
        pattern = { "toml" },
        group = vim.api.nvim_create_augroup("EmbedToml", {}),
        callback = function()
          require("otter").activate()
        end,
      })
    end,
  },
  {
    "brenoprata10/nvim-highlight-colors",
    opts = {
      render = "virtual",
      virtual_symbol = "󱓻",
      virtual_symbol_position = "inline",
    },
  },
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    keys = {
      {
        "<leader>S",
        function()
          Snacks.scratch.select()
        end,
        desc = "Select Scratch Buffer",
      },
      {
        "<leader>N",
        function()
          Snacks.notifier.show_history()
        end,
        desc = "Notification History",
      },
      {
        "<leader>cR",
        function()
          Snacks.rename.rename_file()
        end,
        desc = "Rename File",
      },
      {
        "<leader>gB",
        function()
          Snacks.gitbrowse()
        end,
        desc = "Git Browse",
      },
      {
        "<leader>gb",
        function()
          Snacks.git.blame_line()
        end,
        desc = "Git Blame Line",
      },
      {
        "<leader>gl",
        function()
          Snacks.lazygit.log()
        end,
        desc = "Lazy Git Log",
      },
      {
        "<leader>gf",
        function()
          Snacks.lazygit.log_file()
        end,
        desc = "Lazy Git Log Line",
      },
      {
        "<leader>un",
        function()
          Snacks.notifier.hide()
        end,
        desc = "Dismiss All Notifications",
      },
      {
        "<leader>t",
        function()
          Snacks.terminal()
        end,
        desc = "Toggle Terminal",
      },
      {
        "<leader>f",
        function()
          Snacks.picker.files()
        end,
        desc = "Find File",
      },
      {
        "<leader>.",
        function()
          require("chezmoi.pick").snacks()
        end,
        desc = "Find Dotfile",
      },
      {
        "z=",
        function()
          Snacks.picker.spelling()
        end,
        desc = "Spell Suggestions",
      },
      {
        "<leader>nf",
        function()
          Snacks.picker.files({ cwd = "~/notes", search = "md" })
        end,
        desc = "Find Notes",
      },
      {
        "<leader>ng",
        function()
          Snacks.picker.grep({ cwd = "~/notes" })
        end,
        desc = "Grep Notes",
      },
      {
        "<leader>g",
        function()
          Snacks.picker.grep()
        end,
        desc = "Grep Word",
      },
      {
        "<leader>e",
        function()
          Snacks.picker.explorer()
        end,
        desc = "File Explorer",
      },
      {
        "<leader>p",
        function()
          Snacks.picker.projects()
        end,
        desc = "Find Project",
      },
      {
        "<leader>lg",
        function()
          Snacks.lazygit.open()
        end,
        desc = "Lazy Git",
      },
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
              icon = "󰱼 ",
              text = {
                { "󰱼  ", hl = "Title" },
                { "Find File", hl = "SnacksDashboardDesc", width = 55 },
                { "[f]", hl = "SnacksDashboardKey" },
              },
              desc = "Find File",
              key = "f",
              action = function()
                Snacks.picker.files()
              end,
            },
            {
              text = {
                { "󰷊  ", hl = "Title" },
                { "File Explorer", hl = "SnacksDashboardDesc", width = 55 },
                { "[e]", hl = "SnacksDashboardKey" },
              },
              key = "e",
              action = function()
                Snacks.picker.explorer()
              end,
            },
            {
              text = {
                { "󱈆  ", hl = "Title" },
                { "Find Dotfile", hl = "SnacksDashboardDesc", width = 55 },
                { "[.]", hl = "SnacksDashboardKey" },
              },
              key = ".",
              action = function()
                require("chezmoi.pick").snacks()
              end,
            },
            {
              icon = "󰈆 ",
              text = {
                { "󰈆  ", hl = "Title" },
                { "Quit", hl = "SnacksDashboardDesc", width = 55 },
                { "[q]", hl = "SnacksDashboardKey" },
              },
              key = "q",
              action = function()
                vim.cmd("qa")
              end,
            },
          },
          sections = {
            { section = "header" },
            { section = "keys",   gap = 1, padding = 1 },
            { section = "startup" },
          },
        },
      },
      notifier = { enabled = true },
      quickfile = { enabled = true },
      gitbrowse = { enabled = true },
      terminal = { enabled = true },
      lazygit = { enabled = true },
      image = { enabled = true, doc = { enabled = true, inline = true, float = false } },
      scroll = { enabled = false },
      picker = {
        sources = {
          grep = {
            finder = "grep",
            regex = true,
            format = "file",
            layout = {
              preset = "dropdown",
            },
          },
          explorer = {
            replace_netrw = true,
            hidden = true,
            layout = { layout = { position = 'right' } },
          },
          files = {
            hidden = true,
          },
          projects = {
            layout = {
              preset = "vscode",
            },
          },
        },
      },
      indent = {
        enabled = true,
        hl = "SnacksIndent",
        animate = {
          enabled = false,
        },
        scope = {
          enabled = false,
        },
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
      },
    },
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
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
        popupmenu = {
          enabled = false,
          backend = "cmp",
        },
        notify = { enabled = false },
        message = { enabled = false },
        lsp = {
          progress = { enabled = false },
          hover = { enabled = false },
          signature = { enabled = false },
        },
        cmdline = {
          enabled = true,
          view = "cmdline",
          format = {
            opts = {},
            cmdline = {
              pattern = "^:",
              icon = " ",
              lang = "vim",
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
    end,
  },
  {
    "DavidRR-F/kustomize.nvim",
    -- if dev testing
    --"kustomzie.nvim",
    --dir = "~/dev/kustomize.nvim",
    opts = {
      provider = "snacks",
      path = "./deploy",
      commands = {
        build = {
          enable_helm = true,
        },
      },
    }
  },
  {
    "cbochs/grapple.nvim",
    opts = {
      scope = "git",
      icons = true,
      status = false,
    },
    keys = {
      { "<leader>h", "<cmd>Grapple toggle<cr>",          desc = "Tag a file" },
      { "<leader>H", "<cmd>Grapple toggle_tags<cr>",     desc = "Toggle tags menu" },
      { "<Tab>",     "<cmd>Grapple cycle_tags next<cr>", desc = "Go to next tag" },
      { "<S-Tab>",   "<cmd>Grapple cycle_tags prev<cr>", desc = "Go to previous tag" },
    },
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      { "catppuccin/nvim", as = "catppuccin" },
    },
    config = function()
      local colors = require("catppuccin.palettes").get_palette("mocha")
      local mode_icons = {
        n = "", -- Normal Mode
        i = "󰷫", -- Insert Mode
        v = "", -- Visual Mode
        [""] = "󰈈", -- Visual Block Mode
        V = "󱀦", -- Visual Line Mode
        c = "", -- Command Mode
        no = "", -- Operator-pending Mode
        s = "", -- Select Mode
        S = "", -- Select Line Mode
        [""] = "󱁵", -- Select Block Mode
        R = "", -- Replace Mode
        r = "󰭻", -- Prompt Mode
        ["!"] = "", -- Shell or terminal mode
        t = "", -- Terminal Mode
      }
      local function mode_icon(str)
        return mode_icons[vim.fn.mode()] or str
      end
      local function mode_color()
        local color = {
          n = colors.blue,
          i = colors.green,
          v = colors.mauve,
          [""] = colors.mauve,
          V = colors.mauve,
          c = colors.peach,
          no = colors.red,
          s = colors.peach,
          S = colors.peach,
          [""] = colors.peach,
          ic = colors.yellow,
          R = colors.maroon,
          Rv = colors.maroon,
          cv = colors.red,
          ce = colors.red,
          r = colors.cyan,
          rm = colors.cyan,
          ["r?"] = colors.cyan,
          ["!"] = colors.red,
          t = colors.red,
        }
        return { fg = color[vim.fn.mode()], bg = "none" }
      end
      require("lualine").setup({
        theme = "catppuccin",
        globalstatus = true,
        options = { section_separators = "", component_separators = "", always_show_tabline = false },
        sections = {
          lualine_a = {
            {
              "mode",
              fmt = mode_icon,
              color = mode_color,
              padding = { left = 1, right = 1 },
            },
            {
              "filename",
              path = 1,
              color = mode_color,
              padding = { left = 0, right = 0 },
              symbols = {
                modified = "",
                readonly = "󰈡",
                unnamed = "",
                newfile = "",
              },
            },
          },
          lualine_b = {},
          lualine_c = { "grapple" },
          lualine_x = {},
          lualine_y = {},
          lualine_z = {
            {
              "diff",
              symbols = { added = " ", modified = " ", removed = " " },
              color = { bg = "none" },
            },
            {
              "branch",
              icon = "󰊢",
              color = mode_color,
              padding = { left = 0, right = 1 },
            },
          },
        },
        inactive_sections = {
          lualine_a = { "filename" },
          lualine_b = {},
          lualine_c = {},
          lualine_x = {},
          lualine_y = {},
          lualine_z = { "branch" },
        },
        tabline = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = {},
          lualine_x = {},
          lualine_y = {},
          lualine_z = {},
        },
      })
    end,
  },
  {
    'kevinhwang91/nvim-ufo',
    dependencies = 'kevinhwang91/promise-async',
    config = function()
      require('ufo').setup({
        provider_selector = function(_, filetype, _)
          if filetype == 'markdown' then
            return { 'indent' }
          end
          return { 'treesitter', 'indent' }
        end
      })
      vim.api.nvim_set_hl(0, 'UfoFoldedEllipsis', { fg = '#1e88e5' })
    end
  },
  { 'mrjones2014/smart-splits.nvim' },
  { "tpope/vim-surround" }
}
