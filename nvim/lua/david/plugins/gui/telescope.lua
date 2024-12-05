return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.5',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'kyazdani42/nvim-web-devicons',
    'ThePrimeagen/git-worktree.nvim',
    'nvim-telescope/telescope-ui-select.nvim'
  },
  keys = {
    { "<leader>fb", "<cmd>:Telescope buffers<cr>",                                                 desc = "Buffers" },
    { "<leader>fr", "<cmd>:Telescope registers<cr>",                                               desc = "Registers" },
    { "<leader>ff", "<cmd>:Telescope find_files<cr>",                                              desc = "Find Files" },
    { "<leader>fg", "<cmd>:Telescope live_grep<cr>",                                               desc = "Live Grep" },
    { "<leader>fm", "<cmd>:Telescope marks<cr>",                                                   desc = "Telescope Marks" },
    { "<leader>fc", "<cmd>:lua require('telescope.builtin').commands()<cr>",                       desc = "Builtin Commands List" },
    { "<leader>fs", "<cmd>:lua require('telescope.builtin').git_status()<cr>",                     desc = "Git Status List" },
    { "<leader>ft", "<cmd>:lua require('telescope.builtin').tags()<cr>",                           desc = "Telescope Ctags" },
    { "<leader>fw", "<cmd>:lua require('telescope').extensions.git_worktree.git_worktrees()<cr>",  desc = "Telescope Git Worktrees" },
  },
  config = function()
    require('telescope').setup({
      defaults = {
        file_ignore_patterns = { '.pytest_cache', '__pycache__', 'node_modules', '.venv', '.ruff_cache' },
        vimgrep_arguments = {
          'rg', '--color=never', '--no-heading',
          '--with-filename', '--line-number', '--column', '--smart-case', '--no-ignore'
        },
        path_display = function(opts, path)
          local tail = require("telescope.utils").path_tail(path)
          return string.format("%s (%s)", tail, path)
        end,
        mappings = {
          i = { -- Insert mode mappings
            ["<C-d>"] = require('telescope.actions').preview_scrolling_down,
            ["<C-u>"] = require('telescope.actions').preview_scrolling_up,
          },
          n = { -- Normal mode mappings
            ["<C-d>"] = require('telescope.actions').preview_scrolling_down,
            ["<C-u>"] = require('telescope.actions').preview_scrolling_up,
          },
        },
      },
      pickers = {
        find_files = {
          find_command = {
            'rg', '--files', '--hidden', '--no-ignore', '--sort=path', '--glob', '!**/.git/*'
          }
        },
        live_grep = {
          additional_args = function(opts)
            return { '--no-ignore' }
          end
        },
        git_status = {
          layout_strategy = "vertical",
          layout_config = {
            vertical = {
              height = 0.9,
              preview_cutoff = 20,
              prompt_position = "bottom",
              width = 0.8
            }
          },
          git_icons = {
            added  = '',
            changed  = '',
            deleted  = '',
            renamed  = '󰑙',
            copied  = '',
            untracked  = '',
            unmerged = ''
          },
        }
      },
      extensions = {
        ["ui-select"] = {
          require("telescope.themes").get_dropdown {
            -- even more opts
          }
        }
      }
    })
    require("telescope").load_extension("git_worktree")
    require("telescope").load_extension("ui-select")
  end
}
