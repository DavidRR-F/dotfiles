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

-- resize window
vim.api.nvim_set_keymap('n', '<Leader>ww', ':resize +5<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>ws', ':resize -5<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>wa', ':vertical resize +5<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>wd', ':vertical resize -5<CR>', { noremap = true, silent = true })

-- move cursor in insert mode
keymap.set("i", "<C-h>", "<Left>", { desc = "Move cursor left" })
keymap.set("i", "<C-l>", "<Right>", { desc = "Move cursor right" })
keymap.set("i", "<C-j>", "<Down>", { desc = "Move cursor down" })
keymap.set("i", "<C-k>", "<Up>", { desc = "Move cursor up" })
