return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim"
  },
  config = function()
    require("mason").setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        }
      },
    })
    require("mason-lspconfig").setup({
      ensure_installed = {
        "pyright",
        "gopls",
        "clangd",
        "bashls",
        "powershell_es",
        "jsonls",
        "dockerls",
        "yamlls",
        "tsserver",
        "tailwindcss",
        "emmet_ls",
        "cssls",
        "html",
        "lua_ls",
      },
      automatic_installation = true,
    })
  end
}
