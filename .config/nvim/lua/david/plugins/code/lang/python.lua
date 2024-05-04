local M = {}

function M.lsp(on_attach, capabilities)
  return {				
        on_attach = on_attach,
				capabilities = capabilities,
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
end

function M.test(venv)
  return {
    command = "pytest",
    args = {"--log-level", "DEBUG"},
    runner = "pytest",
    python = venv
  }
end



return M

