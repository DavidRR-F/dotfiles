return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",
    "nvim-neotest/neotest-python",
    "nvim-neotest/neotest-go",
  },
  config = function()
    local neotest = require("neotest")
    local venv = require("venv-selector")
    local python = require("david.plugins.code.lang.python")
    local go = require("david.plugins.code.lang.go")
    neotest.setup({
      adapters = {
        require("neotest-python")(python.test(venv.venv())),
        require("neotest-go")(go.test)
      },
    })
    -- keymaps
    vim.keymap.set('n', '<leader>nt', function()
      neotest.run.run()
    end, { desc = "Run nearest test" })
  end
}
