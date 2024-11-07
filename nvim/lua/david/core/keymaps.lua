-- set leader key to space
local custom = require("david.custom.os")
vim.g.mapleader = " "

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

vim.api.nvim_create_user_command('Pydoc', function(opts)
  local pydoc_cmd = "pydoc " .. opts.args
  local output = vim.fn.systemlist(pydoc_cmd)

  if vim.v.shell_error ~= 0 then
    print("Error: Could not get documentation.")
    return
  end
 
  if #output > 4 then
    output = {unpack(output, 5)}  -- Start from the third line
  end

  -- Remove `^M` characters
  for i, line in ipairs(output) do
    output[i] = line:gsub("\r", "")
  end
  

  -- Create a header title
  local header = "Pydoc: " .. opts.args
  local width = math.floor(vim.o.columns * 0.8)  -- Width of the floating window
  local centered_header = string.format("%s%s", string.rep(" ", math.floor((width - #header) / 2)), header)
  
  table.insert(output, 1, centered_header)  -- Insert the centered header at the top
  table.insert(output, 2, "") 

  -- Create a floating window
  local buf = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, output)
  vim.api.nvim_buf_set_option(buf, "filetype", "python")

  local width = math.floor(vim.o.columns * 0.8)
  local height = math.floor(vim.o.lines * 0.8)
  local opts = {
    style = "minimal",
    relative = "editor",
    width = width,
    height = height,
    row = math.floor((vim.o.lines - height) / 2),
    col = math.floor((vim.o.columns - width) / 2),
    border = "rounded"
  }

  local win = vim.api.nvim_open_win(buf, true, opts)
  vim.api.nvim_buf_set_keymap(buf, 'n', '<Esc>', ':close<CR>', { noremap = true, silent = true })
end, { nargs = 1 })

