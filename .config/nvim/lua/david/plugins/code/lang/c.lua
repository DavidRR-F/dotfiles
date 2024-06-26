local M = {}


function M.lsp(on_attach, capabilities)
  return {
    cmd = { "clangd" },
    single_file_support = true,
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = { "c", "cpp", "objc", "objcpp" },
    settings = {},
  }
end

return M
