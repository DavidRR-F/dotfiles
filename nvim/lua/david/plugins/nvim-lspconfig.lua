return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim"
        },
        config = function()
        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
    
        require('mason').setup()
        local mason_lspconfig = require 'mason-lspconfig'
        mason_lspconfig.setup {
            ensure_installed = { "pyright", "gopls" }
        }
        require("lspconfig").pyright.setup {
            capabilities = capabilities,
            settings = {
                python = {
                    analysis = {
                        typeCheckingMode = "off",
                        diagnosticSeverityOverrides = {
                          reportGeneralTypeIssues = "none", -- Ignore general type issues
                          reportOptionalMemberAccess = "none", -- Ignore optional member access issues
                        }
                    }
                }
            }
        }
        require("lspconfig").gopls.setup {
            capabilities = capabilities,
        }
        end,
    },
}
