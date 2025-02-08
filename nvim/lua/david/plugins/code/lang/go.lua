return {
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
