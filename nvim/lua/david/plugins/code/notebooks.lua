local function jupyter_terminal()
    -- Get the list of available Jupyter kernels
    local handle = io.popen("jupyter kernelspec list --json")
    if handle == nil then
        print("Error: Unable to fetch kernels.")
        return
    end

    local result = handle:read("*a")
    handle:close()

    -- Parse the JSON output to extract kernel names
    local kernels = vim.fn.json_decode(result).kernelspecs
    local kernel_names = {}
    for name, _ in pairs(kernels) do
        table.insert(kernel_names, name)
    end

    -- Use vim.ui.select to prompt the user for kernel selection
    vim.ui.select(kernel_names, { prompt = "Choose a Jupyter kernel:" }, function(choice)
        if choice == nil then
            print("No kernel selected.")
            return
        end

        -- Open a terminal with the selected kernel
        vim.cmd('vsplit | terminal jupyter console --kernel=' .. choice)
    end)
end

local notebook_config = {
  { 
      "GCBallesteros/jupytext.nvim", 
      config = true 
  },
  {
    "jpalardy/vim-slime",
    init = function()
      vim.g.slime_cell_delimiter = "# %%"
      vim.g.slime_target = "neovim"
      vim.g.slime_no_mappings = true
    end,
    config = function()
      vim.g.slime_input_pid = false
      vim.g.slime_suggest_default = true
      vim.g.slime_menu_config = false
      vim.g.slime_neovim_ignore_unlisted = false

      vim.api.nvim_set_keymap('n', '<leader>sc', '<Plug>SlimeSendCell', { noremap = true, silent = true })
      vim.api.nvim_set_keymap('x', '<leader>sv', '<Plug>SlimeRegionSend', { noremap = true, silent = true })
      vim.api.nvim_create_user_command('JupyterTerminal', jupyter_terminal, {})
      vim.api.nvim_create_user_command('IPythonTerminal', 'vsplit | terminal ipython', {})
      vim.api.nvim_set_keymap('n', '<leader>nb', ':JupyterTerminal<CR>', { noremap = true, silent = true })
    end,   
  }
}

return notebook_config 
