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
        "bashls",
        "powershell_es",
        "terraformls",
        "dockerls",
        "jsonls",
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
