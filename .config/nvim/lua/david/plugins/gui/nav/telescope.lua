return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.5',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'Myzel394/jsonfly.nvim',
    'ThePrimeagen/git-worktree.nvim',
    "nvim-telescope/telescope-file-browser.nvim"
  },
  keys = {
    { "<leader>fb", "<cmd>Telescope buffers<cr>",                                                                             desc = "Buffers" },
    { "<leader>ff", "<cmd>Telescope find_files<cr>",                                                                          desc = "Find Files" },
    { "<leader>fg", "<cmd>Telescope live_grep<cr>",                                                                           desc = "Live Grep" },
    { "<leader>fc", "<cmd>:lua require('telescope.builtin').commands()<cr>",                                                  desc = "Builtin Commands List" },
    { "<leader>fw", "<cmd>:lua require('telescope').extensions.git_worktree.git_worktrees()<cr>",                             desc = "Switch Branch" },
    { "<leader>fj", "<cmd>:Telescope jsonfly<cr>" },
    { "<leader>ft", "<cmd>:lua require('telescope').extensions.file_browser.file_browser({ respect_gitignore = false })<cr>", desc = "File Browser" },
    { "<leader>fs", "<cmd>:lua require('telescope.builtin').git_status()<cr>",                                                desc = "Git Status" },
  },
  config = function()
    require('telescope').setup({
      defaults = {
        file_ignore_patterns = { '.pytest_cache', '__pycache__', 'node_modules', '.venv' },
        vimgrep_arguments = {
          'rg', '--color=never', '--no-heading',
          '--with-filename', '--line-number', '--column', '--smart-case', '--no-ignore'
        },
      },
      pickers = {
        find_files = {
          find_command = {
            'rg', '--files', '--hidden', '--no-ignore', '--glob', '!**/.git/*', '--glob', '!**/notebooks/*.py'
          }
        },
        live_grep = {
          additional_args = function(opts)
            return { '--no-ignore' }
          end
        }
      },
      extensions = {
        file_browser = {
          theme = "ivy",
          hijack_netrw = true,
          mappings = {
            ["i"] = {
              ["<C-n>"] = require('telescope').extensions.file_browser.actions.create,
              ["<C-c>"] = require('telescope').extensions.file_browser.actions.copy,
              ["<C-m>"] = require('telescope').extensions.file_browser.actions.move,
              ["<C-d>"] = require('telescope').extensions.file_browser.actions.remove,
              ["<C-r>"] = require('telescope').extensions.file_browser.actions.rename,
            },
            ["n"] = {
              ["n"] = require('telescope').extensions.file_browser.actions.create,
              ["c"] = require('telescope').extensions.file_browser.actions.copy,
              ["m"] = require('telescope').extensions.file_browser.actions.move,
              ["d"] = require('telescope').extensions.file_browser.actions.remove,
              ["r"] = require('telescope').extensions.file_browser.actions.rename,
            },
          },
        },
        jsonfly = {
          mirror = true,
          layout_strategy = "vertical",
          layout_config = {
            mirror = true,
            preview_height = 0.65,
            prompt_position = "top",
          },
          key_exact_length = true
        }
      }
    })
    require('telescope').load_extension('jsonfly')
    require('telescope').load_extension('git_worktree')
    require("telescope").load_extension("file_browser")
  end,
}