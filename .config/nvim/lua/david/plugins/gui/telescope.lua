return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.5',
  dependencies = { 'nvim-lua/plenary.nvim' },
  keys = {
    { "<C-s>", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
    {"<C-x>", "<cmd>Telescope buffers<cr>", desc = "Find Text" } 
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

  end,
}

