local custom_git_icons = {
  ['??'] = '',   -- Untracked
  ['A']  = '',   -- Added
  ['M']  = '',   -- Modified
  ['D']  = '',   -- Deleted
  ['R']  = '󰑙',   -- Renamed
  ['C']  = '',   -- Copied
  ['!']  = '',   -- Ignored
}

return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.5',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'kyazdani42/nvim-web-devicons',
    'ThePrimeagen/git-worktree.nvim',
  },
  keys = {
    { "<leader>fb", "<cmd>:Telescope buffers<cr>",                                                 desc = "Buffers" },
    { "<leader>fr", "<cmd>:Telescope registers<cr>",                                               desc = "Registers" },
    { "<leader>ff", "<cmd>:Telescope find_files<cr>",                                              desc = "Find Files" },
    { "<leader>fg", "<cmd>:Telescope live_grep<cr>",                                               desc = "Live Grep" },
    { "<leader>fc", "<cmd>:lua require('telescope.builtin').commands()<cr>",                      desc = "Builtin Commands List" },
    { "<leader>fw", "<cmd>:lua require('telescope').extensions.git_worktree.git_worktrees()<cr>", desc = "Switch Branch" },
    { "<leader>fs", "<cmd>lua require('telescope.builtin').git_status()<CR>",                     desc = "Git Status" },
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
        end
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
        }
      }
    })
    require('telescope').load_extension('git_worktree')
  end,
}
