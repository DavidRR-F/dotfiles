return {
  "GCBallesteros/NotebookNavigator.nvim",
  keys = {
    { "]h", function() require("notebook-navigator").move_cell "d" end },
    { "[h", function() require("notebook-navigator").move_cell "u" end },
    { "<leader>X", "<cmd>lua require('notebook-navigator').run_cell()<cr>" },
    { "<leader>x", "<cmd>lua require('notebook-navigator').run_and_move()<cr>" },
  },
  dependencies = {
    {"GCBallesteros/jupytext.nvim", config = true},
    {'akinsho/toggleterm.nvim', version = "*", config = true}
  },
  event = "VeryLazy",
  config = function()
    local nn = require "notebook-navigator"
    nn.setup({
      repl_provider = "toggleterm"
    })
  end,
}
