local M = {}

function M.lsp(on_attach, capabilities, root)
  return {
    cmd = { "gopls" },
    single_file_support = true,
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = { "go", "gomod", "gowork", "gotmpl" },
    root_dir = root,
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
  }
end

M.test = {
  experimental = {
    test_table = true,
  },
  args = { "-count=1", "-timeout=60s" }
}

return M
