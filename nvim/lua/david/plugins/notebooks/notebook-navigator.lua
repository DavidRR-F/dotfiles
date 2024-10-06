return {
  "GCBallesteros/NotebookNavigator.nvim",
  keys = {
    { "<leader>k",
      function()
        require("notebook-navigator").move_cell("u")
        vim.cmd('normal! zz')
      end
    },
    { "<leader>j",
      function()
        require("notebook-navigator").move_cell("d")
        vim.cmd('normal! zz')
      end
    },
    { "<leader>x",
      function()
        require('notebook-navigator').run_and_move()
        vim.cmd('normal! zz')
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
      syntax_highlight = true
    })

    require("mini.hipatterns").setup({
      highlighters = { cells = nn.minihipatterns_spec }
    })
  end,
}
