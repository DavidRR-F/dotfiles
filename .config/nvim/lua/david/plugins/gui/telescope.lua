return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.5',
  dependencies = { 
    'nvim-lua/plenary.nvim',
    "radyz/telescope-gitsigns",
    "ThePrimeagen/git-worktree.nvim",
  },
  keys = {
    { "<C-z>", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
    { "<C-s>", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
    {"<C-e>", "<cmd>Telescope git_status<cr>", desc = "Find Changes" },
    {"<C-x>", "<cmd>Telescope git_sign<cr>", desc = "Find File Changes" },
    {"<C-w>", "<cmd>:lua require('telescope').extensions.git_worktree.git_worktrees()<cr>", desc = "Switch Branch" },

  },
  config = function()
    require('telescope').setup({
      defaults = {
          file_ignore_patterns = {'.pytest_cache', '__pycache__', 'node_modules', '.venv'},  -- Clearing default ignores to override with custom settings

        -- Default configuration for all pickers
        vimgrep_arguments = {
          'rg', '--color=never', '--no-heading',
          '--with-filename', '--line-number', '--column', '--smart-case', '--no-ignore'
        },
      },
      pickers = {
        -- Configuring 'find_files' to explicitly use 'fd'
        find_files = {
          find_command = {
            'rg', '--files', '--hidden', '--no-ignore', '--glob', '!**/.git/*', '--glob', '!**/notebooks/*.py'
          }
        },
        
        -- Configuration for 'live_grep' to ensure it does not ignore files
        live_grep = {
          additional_args = function(opts)
            return {'--no-ignore'}
          end
        }
      }
    })

    require('telescope').load_extension('git_signs')
    require('telescope').load_extension('git_worktree')
  end,
}

