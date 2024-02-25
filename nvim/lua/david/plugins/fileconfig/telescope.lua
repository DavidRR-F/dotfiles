return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.5',
  dependencies = { 'nvim-lua/plenary.nvim' },
  keys = {
    { "<C-t>", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
    { "<C-g>", "<cmd>Telescope live_grep<cr>", desc = "Live Grep" },
    { "<Esc>", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
  },
  config = function()
    require('telescope').setup({
      defaults = {
        file_ignore_patterns = { 'node_modules', '__pycache__', '.venv' },
      }
    })
  end,
}
