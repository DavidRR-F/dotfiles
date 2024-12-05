local M = {}
local function floating_doc_window(opts)
   
    if #opts.output > 4 then
      opts.output = {unpack(opts.output, 5)}  
    end

    for i, line in ipairs(opts.output) do
      opts.output[i] = line:gsub("\r", "")
    end
    
    local header = opts.name .. ": " .. opts.args
    local width = math.floor(vim.o.columns * 0.8)  
    local centered_header = string.format("%s%s", string.rep(" ", math.floor((width - #header) / 2)), header)
    
    table.insert(opts.output, 1, centered_header)  
    table.insert(opts.output, 2, "") 

    local buf = vim.api.nvim_create_buf(false, true)
    vim.api.nvim_buf_set_lines(buf, 0, -1, false, opts.output)
    vim.api.nvim_buf_set_option(buf, "filetype", opts.filetype)

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
end

M.config = function()
  -- Pydoc
  vim.api.nvim_create_user_command('Pydoc', 
      function(opts)
        local cmd = "python -m pydoc " .. opts.args
        local output = vim.fn.systemlist(cmd)

        if vim.v.shell_error ~= 0 then
          print("Error: Could not get documentation.")
          return
        end

        floating_doc_window({
          output = output,
          args = opts.args,
          name = "Pydoc",
          filetype = "python"
        })
      end, 
  { nargs = 1 })
  -- Godoc
  vim.api.nvim_create_user_command('Godoc', 
      function(opts)
        local cmd = "godoc " .. opts.args
        local output = vim.fn.systemlist(cmd)

        if vim.v.shell_error ~= 0 then
          print("Error: Could not get documentation.")
          return
        end

        floating_doc_window({
          output = output,
          args = opts.args,
          name = "Godoc",
          filetype = "go"
        })
      end, 
  { nargs = 1 })
end

return M
