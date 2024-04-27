return {
  "GCBallesteros/NotebookNavigator.nvim",
  keys = {
    { "]h", function() require("notebook-navigator").move_cell("d") end },
    { "[h", function() require("notebook-navigator").move_cell("u") end },
    { "<leader>X", "<cmd>lua require('notebook-navigator').run_cell()<cr>" },
    { "<leader>x", 
      function()
        require('notebook-navigator').run_and_move()
        vim.cmd('normal! zz')  -- Center the screen on the cursor
      end 
    },
  },
  dependencies = {
    "echasnovski/mini.comment",
    "benlubas/molten-nvim",
    "anuvyklack/hydra.nvim",
    "echasnovski/mini.hipatterns",
    "echasnovski/mini.ai"
  },
  ft = "ipynb",
  event = "VeryLazy",
  opts = function()
    local nn = require "notebook-navigator"

    local opts = { custom_textobjects = { h = nn.miniai_spec } }
    return opts
  end,
  config = function()
    local nn = require("notebook-navigator")
    nn.setup({ 
      activate_hydra_keys = "<leader>h",
      syntax_highlight = true
    })

    -- Configure mini.hipatterns for cell highlighting
    require("mini.hipatterns").setup({
      highlighters = { cells = nn.minihipatterns_spec }
    })
  end,
}
