-- set leader key to space
vim.g.mapleader = ";"

vim.o.clipboard = "unnamedplus"

local keymap = vim.keymap

-- mouse scroll
keymap.set("n", "<ScrollWheelUp>", "<C-Y>", { silent = true })
keymap.set("n", "<ScrollWheelDown>", "<C-E>", { silent = true })

-- tab indent
keymap.set("v", "<Tab>", ">gv", { silent = true })
keymap.set("v", "<S-Tab>", "<gv", { silent = true })

-- windows
vim.api.nvim_set_keymap('n', '<Leader>sv', ':vsplit<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>sh', ':split<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>wk', '<C-w>K', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>wj', '<C-w>J', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>wh', '<C-w>H', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>wl', '<C-w>L', { noremap = true, silent = true })

-- buffers
vim.api.nvim_set_keymap('n', '<Leader>bn', ':bnext<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>bp', ':bprevious<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>bl', ':b#<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>bd', ':bd<CR>', { noremap = true, silent = true })

-- Netrw
vim.api.nvim_set_keymap('n', '<Leader>fe', ':Explore<CR>', { noremap = true, silent = true })

-- zoom
vim.api.nvim_set_keymap("n", "<Leader>i", ":wincmd _ | :wincmd |<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>o", ":wincmd =<CR>", { noremap = true, silent = true })
