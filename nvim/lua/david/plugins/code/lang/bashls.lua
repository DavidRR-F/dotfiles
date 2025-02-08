return {
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
