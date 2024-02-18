-- set leader key to space
vim.g.mapleader = " "

vim.o.clipboard = "unnamedplus"

local keymap = vim.keymap -- for conciseness

-- use jk to exit insert mode
keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

-- mouse scroll
keymap.set("n", "<ScrollWheelUp>", "<C-Y>", { silent = true })
keymap.set("n", "<ScrollWheelDown>", "<C-E>", { silent = true })

-- tab indent
keymap.set("v", "<Tab>", ">gv", { silent = true })
keymap.set("v", "<S-Tab>", "<gv", { silent = true })
