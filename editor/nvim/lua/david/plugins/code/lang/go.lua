return {
  name = {
    lsp = "gopls",
    dap = { adapter = "delve", config = "go" }
  },
  dap = {
    adapter = {
      type = 'server',
      port = '${port}',
      executable = {
        command = vim.fn.exepath('dlv'),
        args = { 'dap', '-l', '127.0.0.1:${port}' },
      },
    },
    config = {
      {
        type = 'delve',
        name = 'Delve: Debug',
        request = 'launch',
        program = '${workspaceFolder}',
      },
      {
        type = 'delve',
        name = 'Delve: Debug (Arguments)',
        request = 'launch',
        program = '${workspaceFolder}',
        args = function()
          return vim.split(vim.fn.input('Args: '), ' ')
        end,
      },
      {
        type = 'delve',
        name = 'Delve: Debug test', -- configuration for debugging test files
        request = 'launch',
        mode = 'test',
        program = '${file}',
      },
      -- works with go.mod packages and sub packages
      {
        type = 'delve',
        name = 'Delve: Debug test (go.mod)',
        request = 'launch',
        mode = 'test',
        program = './${relativeFileDirname}',
      },
    }
	},
  lsp = {
    cmd = { "gopls" },
    settings = {
      gopls = {
        completeUnimported = true,
        analyses = {
          unusedparams = true,
          shadow = true,
        },
        staticcheck = true,
      },
    },
    single_file_support = true,
    filetypes = { "go", "gomod", "gowork", "gotmpl" },
  }
}
