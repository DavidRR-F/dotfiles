return {
  "nvim-neotest/neotest",
  optional = true,
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",    
    "nvim-neotest/neotest-python",
  },
  opts = {
    adapters = {
      ["neotest-python"] = {
        -- Here you can specify the settings for the adapter, i.e.
        dap = { justMyCode = true },
        runner = "pytest",
        python = require("david.plugins.lang.python").get_venv(),
      },
    },
  },
}
