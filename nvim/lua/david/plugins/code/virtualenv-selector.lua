return {
  "linux-cultist/venv-selector.nvim",
  dependencies = {
    "neovim/nvim-lspconfig",
    --"mfussenegger/nvim-dap", "mfussenegger/nvim-dap-python", --optional
    { "nvim-telescope/telescope.nvim", branch = "0.1.x", dependencies = { "nvim-lua/plenary.nvim" } 
    },
  },
  lazy = true,
  branch = "regexp", -- This is the regexp branch, use this for the new version
  config = function()
    require("venv-selector").setup({
      settings = {
        options = {
          notify_user_on_venv_activation = true,
          require_lsp_activation = false,
          show_telescope_search_type = true
        },
      }
    })
    vim.api.nvim_create_autocmd('BufEnter', {
      desc = 'Auto Activate Venv on Buffer Enter',
      pattern = '*.py',
      callback = function()
        local os = require('david.custom.os')
        local venv = vim.fn.findfile('pyproject.toml', vim.fn.getcwd() .. ';')
        if venv ~= '' then
          local python_path = vim.fn.getcwd() .. '/.venv' .. os.settings.python_exe
          local selector = require("venv-selector")
          if selector.venv() ~= python_path then
            require("venv-selector").activate_from_path(python_path)
            print("Venv Activated")
          end
        end
      end,
      once = true,
    })
  end,
  keys = {
    { "<leader>vs", "<cmd>VenvSelect<cr>" },
    { "<leader>vl", "<cmd>VenvSelectLog<cr>" },
  },
}
