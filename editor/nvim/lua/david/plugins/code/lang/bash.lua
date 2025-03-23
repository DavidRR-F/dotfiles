return {
  name = {
    lsp = "bashls",
    dap = { adapter = "bash", config = "sh" }
  },
  dap = {
    adapter = {
      type = 'executable',
	    command = vim.fn.exepath('bash-debug-adapter'),
    },
    config = {
      {
        type = 'bash',
        request = 'launch',
        name = 'Bash: Launch file',
        program = '${file}',
        cwd = '${fileDirname}',
        pathBashdb = vim.fn.expand('$MASON/packages/bash-debug-adapter/extension/bashdb_dir') .. '/bashdb',
        pathBashdbLib = vim.fn.expand('$MASON/packages/bash-debug-adapter/extension/bashdb_dir'),
        pathBash = 'bash',
        pathCat = 'cat',
        pathMkfifo = 'mkfifo',
        pathPkill = 'pkill',
        env = {},
        args = {},
        terminalKind = 'integrated',
      }
    }
	},
  lsp = {
    settings = {
      bashIde = {
        shellcheckPath = "shellcheck",
        enableSourceErrorDiagnostics = true,
        globPattern = vim.env.GLOB_PATTERN or '*@(.sh|.inc|.bash|.command)',
      },
      filetypes = { "bash", "sh" },
      single_file_support = true,
    }
  }
}
