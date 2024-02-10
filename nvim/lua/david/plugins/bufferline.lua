return {
  'akinsho/bufferline.nvim', 
  version = "*", 
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = function()
    require("bufferline").setup{
      options = {
        offsets = {{filetype = "NvimTree", text = "File Explorer", highlight = "Directory", text_align = "left"}},
        show_buffer_icons = false,
        show_close_icon = true
      }
    } 
    local opts = { noremap = true, silent = true }
    vim.api.nvim_set_keymap('n', '<Leader>t', ':bdelete! %d<CR>', opts)
    vim.api.nvim_set_keymap('n', '<TAB>', ':BufferLineCycleNext<CR>', opts)
    vim.api.nvim_set_keymap('n', '<S-TAB>', ':BufferLineCyclePrev<CR>', opts)
  end
}
