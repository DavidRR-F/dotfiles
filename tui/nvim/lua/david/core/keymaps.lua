-- set leader key to space
local custom = require("david.custom.os")
vim.g.mapleader = " "
vim.g.python3_host_prog = vim.fn.expand(custom.get_os_settings().python_host)

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
vim.api.nvim_set_keymap('n', '<Leader>bd', ':bd<CR>', { noremap = true, silent = true })

-- messages
vim.api.nvim_set_keymap('n', '<Leader>M', ':messages<CR>', { noremap = true, silent = true })

-- custom commands
local spell_checker = require("david.custom.spell_checker")

vim.api.nvim_set_keymap('n', 'z=', ':lua require("david.custom.spell_checker").spell_suggest_popup()<CR>',
  { noremap = true, silent = true })
