return {
  "tpope/vim-fugitive",
  config = function()
    vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
    vim.api.nvim_set_keymap('n', '<Leader>gd', ':Gitdiffsplit!<CR>', { noremap = true, silent = true }) 
  end
}
