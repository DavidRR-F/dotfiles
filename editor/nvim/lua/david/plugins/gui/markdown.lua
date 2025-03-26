return {
  {
    'MeanderingProgrammer/render-markdown.nvim',
    ft = { "markdown" },
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' },
    opts = {
      code = {
        left_pad = 2,
        right_pad = 2
      },
      render_modes = true
    }
  },
  {
    "iamcco/markdown-preview.nvim",
    ft = { "markdown" },
    cmd = { "MarkdownPreviewToggle" },
    build = "cd app && npm install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
      vim.g.mkdp_theme = "dark"
      vim.api.nvim_set_keymap('n', '<leader>np', '<cmd>MarkdownPreviewToggle<CR>', { noremap = true, silent = true })
    end,
  },
  {
    "HakonHarnes/img-clip.nvim",
    ft = { "markdown" },
    event = "VeryLazy",
    opts = {},
    keys = {
      { "<leader>ni", "<cmd>PasteImage<CR>", desc = "Paste image from system clipboard" },
    },
  }
}
