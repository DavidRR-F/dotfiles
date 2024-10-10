return {
  "linux-cultist/venv-selector.nvim",
  dependencies = {
    "neovim/nvim-lspconfig",
    "mfussenegger/nvim-dap", "mfussenegger/nvim-dap-python", --optional
    { "nvim-telescope/telescope.nvim", branch = "0.1.x", dependencies = { "nvim-lua/plenary.nvim" } },
  },
  lazy = false,
  branch = "regexp", -- This is the regexp branch, use this for the new version
  config = function()
    require("venv-selector").setup({
      settings = {
        options = {
          debug = true,
          show_telescope_search_type = false
        },
      }
    })
  end,
  keys = {
    { "<leader>vs", "<cmd>VenvSelect<cr>" },
    { "<leader>vl", "<cmd>VenvSelectLog<cr>" },
  },
}
