return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.5',
  dependencies = { 'nvim-lua/plenary.nvim' },
  keys = {
    { "<C-a>", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
    {"<C-s>", "<cmd>Telescope buffers<cr>", desc = "Find Text" } 
  },
  config = function()
    require('telescope').setup({
      defaults = {
        file_ignore_patterns = { '.git', 'node_modules', '__pycache__', '.venv' },
      }, 
    })
  end,
}
