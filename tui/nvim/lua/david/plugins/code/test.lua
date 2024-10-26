return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",
    "nvim-neotest/neotest-python",
  },
  config = function()
    local neotest = require("neotest")
    local venv = require("venv-selector")
    neotest.setup({
      adapters = {
        require("neotest-python")({
          command = "pytest",
          args = { "--log-level", "DEBUG" },
          runner = "pytest",
          python = venv.venv()
        }),
      },
    })
    -- keymaps
    vim.keymap.set('n', '<leader>nt', function()
      neotest.run.run()
    end, { desc = "Run nearest test" })
  end
}
