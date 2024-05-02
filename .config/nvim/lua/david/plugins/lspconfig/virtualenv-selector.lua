return {
  "linux-cultist/venv-selector.nvim",
  dependencies = { 'neovim/nvim-lspconfig', 'nvim-telescope/telescope.nvim', 'mfussenegger/nvim-dap-python' },
  cmd = "VenvSelect",
  opts = {
    default_venv = ".venv",
    auto_refresh = false,
    dap_enabled = true,
  },
  keys = { 
    { "<leader>vs", "<cmd>:VenvSelect<cr>", desc = "Select VirtualEnv" },
    { '<leader>vc', '<cmd>VenvSelectCached<cr>', desc = "Select Cached VirtualEnv" },
  },
}
