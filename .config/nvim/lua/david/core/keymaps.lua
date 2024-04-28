-- set leader key to space
vim.g.mapleader = " "

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

-- window navigation
keymap.set("n", "<C-h>", "<C-w>h")
keymap.set("n", "<C-j>", "<C-w>j")
keymap.set("n", "<C-k>", "<C-w>k")
keymap.set("n", "<C-l>", "<C-w>l")

-- navigate in insert mode 
keymap.set("i", "<C-M-h>", "<Left>")
keymap.set("i", "<C-M-j>", "<Down>")
keymap.set("i", "<C-M-k>", "<Up>")
keymap.set("i", "<C-M-l>", "<Right>")
