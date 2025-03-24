return {
  {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' },
    opts = {
      code = {
        left_pad = 2,
        right_pad = 2
      }
    }
  },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle" },
    build = "cd app && npm install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
      vim.g.mkdp_theme = "dark"
      vim.api.nvim_set_keymap('n', '<leader>np', '<cmd>MarkdownPreviewToggle<CR>', { noremap = true, silent = true })
    end,
    ft = { "markdown" },
  },
  {
    "HakonHarnes/img-clip.nvim",
    event = "VeryLazy",
    opts = {},
    keys = {
      { "<leader>ni", "<cmd>PasteImage<CR>", desc = "Paste image from system clipboard" },
    },
  }
}
