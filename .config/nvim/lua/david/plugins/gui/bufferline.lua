local harpoon = {
  'ThePrimeagen/harpoon',
  config = function()
    require("harpoon").setup()
    vim.keymap.set("n", "<C-a>", require("harpoon.ui").toggle_quick_menu)
    vim.keymap.set("n", "<Tab>", function() require("harpoon.ui").nav_next() end)
    vim.keymap.set("n", "<S-Tab>", function() require("harpoon.ui").nav_prev() end)
    vim.keymap.set("n", "<Leader>a", function() require("harpoon.mark").add_file() end)
  end
}

local bufferline = {
  'akinsho/bufferline.nvim', 
  version = "*", 
  dependencies = {'nvim-tree/nvim-web-devicons', "Mofiqul/vscode.nvim"},
  config = function()
    require("bufferline").setup{
      options = {
        close_command = "bdelete %d",
        indicator = {
          style = "icon",
          icon = " ",
        },
        left_trunc_marker = "",
        modified_icon = "●",
        offsets = { { filetype = "NvimTree", text = "EXPLORER", text_align = "center" } },
        right_mouse_command = "bdelete! %d",
        right_trunc_marker = "",
        show_close_icon = true,
        show_tab_indicators = true,
    },
    highlights = {
        fill = {
            fg = { attribute = "fg", highlight = "Normal" },
            bg = { attribute = "bg", highlight = "StatusLineNC" },
        },
        background = {
            fg = { attribute = "fg", highlight = "Normal" },
            bg = { attribute = "bg", highlight = "StatusLine" },
        },
        buffer_visible = {
            fg = { attribute = "fg", highlight = "Normal" },
            bg = { attribute = "bg", highlight = "Normal" },
        },
        buffer_selected = {
            fg = { attribute = "fg", highlight = "Normal" },
            bg = { attribute = "bg", highlight = "Normal" },
        },
        separator = {
            fg = { attribute = "bg", highlight = "Normal" },
            bg = { attribute = "bg", highlight = "StatusLine" },
        },
        separator_selected = {
            fg = { attribute = "fg", highlight = "Special" },
            bg = { attribute = "bg", highlight = "Normal" },
        },
        separator_visible = {
            fg = { attribute = "fg", highlight = "Normal" },
            bg = { attribute = "bg", highlight = "StatusLineNC" },
        },
        close_button = {
            fg = { attribute = "fg", highlight = "Normal" },
            bg = { attribute = "bg", highlight = "StatusLine" },
        },
        close_button_selected = {
            fg = { attribute = "fg", highlight = "Normal" },
            bg = { attribute = "bg", highlight = "Normal" },
        },
        close_button_visible = {
            fg = { attribute = "fg", highlight = "Normal" },
            bg = { attribute = "bg", highlight = "Normal" },
        },
    },
    } 
    local opts = { noremap = true, silent = true }
    vim.api.nvim_set_keymap('n', '<Leader>w', ':execute "silent bufdo if bufexists(".bufnr("").") | if buflisted(bufnr("")) && bufwinnr(bufnr("")) == -1 | bdelete | endif | endif"<CR>', opts)
    vim.api.nvim_set_keymap('n', '<Leader>t', ':lua require("bufferline").buf_delete(%d)<CR>', opts)
    vim.api.nvim_set_keymap('n', '<TAB>', ':BufferLineCycleNext<CR>', opts)
    vim.api.nvim_set_keymap('n', '<S-TAB>', ':BufferLineCyclePrev<CR>', opts)
  end
}

return harpoon
