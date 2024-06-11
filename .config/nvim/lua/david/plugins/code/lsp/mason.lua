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
                "tsserver", 
                "tailwindcss",
                "emmet_ls",
                "cssls",
                "html",
            },
            automatic_installation = true,
        })
    end
}
