local M = {}

function M.lsp(on_attach, capabilities)
  return {			
    cmd = {
      "clangd",
    },
    filetypes = { "c", "cpp", "objc", "objcpp" },
    single_file_support = true,
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

return M
