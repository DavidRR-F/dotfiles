return {
  "linux-cultist/venv-selector.nvim",
  dependencies = { 'neovim/nvim-lspconfig', 'nvim-telescope/telescope.nvim', 'mfussenegger/nvim-dap-python' },
  cmd = "VenvSelect",
  opts = {
    default_venv = ".venv",
    auto_refresh = true,
    dap_enabled = true,
    stay_on_this_version = true,
  },
  keys = {
    { "<leader>vs", "<cmd>:VenvSelect<cr>",      desc = "Select VirtualEnv" },
    { '<leader>vc', '<cmd>VenvSelectCached<cr>', desc = "Select Cached VirtualEnv" },
  },
}
