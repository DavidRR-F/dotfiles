return {
  'mrjones2014/smart-splits.nvim',
  config = function()
    require('smart-splits').setup({
      ignored_buftypes = {
        'nofile',
        'quickfix',
        'prompt',
      },
      ignored_filetypes = { 'NvimTree' },
      default_amount = 5,
      float_win_behavior = 'previous',
      move_cursor_same_row = false,
      cursor_follows_swapped_bufs = false,
      ignored_events = {
        'BufEnter',
        'WinEnter',
      },
      log_level = 'info',
    })
    vim.keymap.set('n', '<M-h>', require('smart-splits').resize_left)
    vim.keymap.set('n', '<M-j>', require('smart-splits').resize_down)
    vim.keymap.set('n', '<M-k>', require('smart-splits').resize_up)
    vim.keymap.set('n', '<M-l>', require('smart-splits').resize_right)
    -- moving between splits
    vim.keymap.set('n', '<C-k>', require('smart-splits').move_cursor_up)
    vim.keymap.set('n', '<C-l>', require('smart-splits').move_cursor_right)
    vim.keymap.set('n', '<C-\\>', require('smart-splits').move_cursor_previous)
    -- swapping buffers between windows
    vim.keymap.set('n', '<leader><leader>h', require('smart-splits').swap_buf_left)
    vim.keymap.set('n', '<leader><leader>j', require('smart-splits').swap_buf_down)
    vim.keymap.set('n', '<leader><leader>k', require('smart-splits').swap_buf_up)
    vim.keymap.set('n', '<leader><leader>l', require('smart-splits').swap_buf_right)
  end
}
