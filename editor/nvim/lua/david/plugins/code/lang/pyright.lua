return {
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
