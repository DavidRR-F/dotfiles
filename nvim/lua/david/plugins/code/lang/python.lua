return {
  name = {
    lsp = "pyright",
    dap = { adapter = "python", config = "python" },
  },
  dap = {
    adapter = {
      type = 'executable',
      command = vim.fn.exepath('debugpy-adapter'),
    },
    config = {
      {
        type = 'python',
        request = 'launch',
        name = 'Python: Launch file',
        program = '${file}',
        pythonPath = vim.fn.getcwd() .. "/.venv"
            and ((vim.fn.has("win32") == 1 and vim.fn.getcwd() .. "/.venv/Scripts/python") or vim.fn.getcwd() .. "/.venv/bin/python")
          or nil,
        console = 'integratedTerminal',
      },
    }
  },
  lsp = {
   settings = {
      python = {
        analysis = {
          typeCheckingMode = "off",
          useLibraryCodeForTypes = true,
          diagnosticSeverityOverrides = {
            reportGeneralTypeIssues = "none",
            reportOptionalMemberAccess = "none",
          },
        },
      },
    },
    filetypes = { "python" },
  }
}
