vim.g.mapleader = " "

vim.o.clipboard = "unnamedplus"

local keymap = vim.keymap

-- mouse scroll
keymap.set("n", "<ScrollWheelUp>", "<C-Y>", { silent = true })
keymap.set("n", "<ScrollWheelDown>", "<C-E>", { silent = true })

-- windows
vim.api.nvim_set_keymap("n", "<Leader>sv", ":vsplit<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>sh", ":split<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>wk", "<C-w>K", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>wj", "<C-w>J", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>wh", "<C-w>H", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>wl", "<C-w>L", { noremap = true, silent = true })

-- buffers
vim.api.nvim_set_keymap("n", "<Leader>bn", ":bnext<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>bp", ":bprevious<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>bl", ":b#<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>bd", ":bd<CR>", { noremap = true, silent = true })

-- zoom
vim.api.nvim_set_keymap("n", "<Leader>i", ":wincmd _ | :wincmd |<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>o", ":wincmd =<CR>", { noremap = true, silent = true })

-- smart-split
vim.keymap.set('n', '<M-h>', require('smart-splits').resize_left)
vim.keymap.set('n', '<M-j>', require('smart-splits').resize_down)
vim.keymap.set('n', '<M-k>', require('smart-splits').resize_up)
vim.keymap.set('n', '<M-l>', require('smart-splits').resize_right)
vim.keymap.set('n', '<C-k>', require('smart-splits').move_cursor_up)
vim.keymap.set('n', '<C-l>', require('smart-splits').move_cursor_right)
vim.keymap.set('n', '<C-j>', require('smart-splits').move_cursor_down)
vim.keymap.set('n', '<C-h>', require('smart-splits').move_cursor_left)
vim.keymap.set('n', '<C-\\>', require('smart-splits').move_cursor_previous)
vim.keymap.set('n', '<leader><leader>h', require('smart-splits').swap_buf_left)
vim.keymap.set('n', '<leader><leader>j', require('smart-splits').swap_buf_down)
vim.keymap.set('n', '<leader><leader>k', require('smart-splits').swap_buf_up)
vim.keymap.set('n', '<leader><leader>l', require('smart-splits').swap_buf_right)
