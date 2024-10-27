return {
  "tpope/vim-fugitive",
  config = function()
    vim.api.nvim_set_keymap('n', '<Leader>gd', '<cmd>Gvdiffsplit<CR>', { noremap = true, silent = true })
  end
}
