-- set leader key to space
vim.g.mapleader = " "
vim.g.python3_host_prog = vim.fn.expand('$HOME/.pyenv/versions/neovim3/bin/python')
vim.o.clipboard = "unnamedplus"

local keymap = vim.keymap -- for conciseness

-- use jk to exit insert mode
keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })
keymap.set("v", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

-- mouse scroll
keymap.set("n", "<ScrollWheelUp>", "<C-Y>", { silent = true })
keymap.set("n", "<ScrollWheelDown>", "<C-E>", { silent = true })

-- tab indent
keymap.set("v", "<Tab>", ">gv", { silent = true })
keymap.set("v", "<S-Tab>", "<gv", { silent = true })

-- windows
vim.api.nvim_set_keymap('n', '<Leader>k', ':resize +5<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>j', ':resize -5<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>h', ':vertical resize +5<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>l', ':vertical resize -5<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>sv', ':vsplit<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>sh', ':split<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>wk', '<C-w>K', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>wj', '<C-w>J', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>wh', '<C-w>H', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>wl', '<C-w>L', { noremap = true, silent = true })

-- tabs
vim.api.nvim_set_keymap('n', '<Leader>to', ':tabnew<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>tx', ':tabclose<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>tn', ':tabn<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>tp', ':tabp<CR>', { noremap = true, silent = true })

-- buffers
vim.api.nvim_set_keymap('n', '<Leader>bn', ':bnext<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>bp', ':bprevious<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>bd', ':bd<CR>', { noremap = true, silent = true })

-- move cursor in insert mode
keymap.set("i", "<C-h>", "<Left>", { desc = "Move cursor left" })
keymap.set("i", "<C-l>", "<Right>", { desc = "Move cursor right" })
keymap.set("i", "<C-j>", "<Down>", { desc = "Move cursor down" })
keymap.set("i", "<C-k>", "<Up>", { desc = "Move cursor up" })

-- poetry commands
vim.api.nvim_set_keymap('n', '<Leader>pi', ':!poetry install<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>pe', ':!poetry env info<CR>', { noremap = true, silent = true })

-- messages
vim.api.nvim_set_keymap('n', '<Leader>M', ':messages<CR>', { noremap = true, silent = true })

-- terminals
vim.api.nvim_set_keymap('n', '<Leader>t', ':split | te<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('t', '<C-d>', '<C-\\><C-n>:bdelete!<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('t', 'jk', '<C-\\><C-n>', { noremap = true, silent = true })

-- custom commands
local spell_checker = require("david.custom.spell_checker")

vim.api.nvim_set_keymap('n', 'z=', ':lua require("david.custom.spell_checker").spell_suggest_popup()<CR>',
  { noremap = true, silent = true })
