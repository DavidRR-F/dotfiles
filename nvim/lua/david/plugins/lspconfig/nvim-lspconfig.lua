return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
		},
		config = function()
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

			require("mason").setup()
			local mason_lspconfig = require("mason-lspconfig")
			mason_lspconfig.setup({
				ensure_installed = { "pyright", "gopls", "tsserver", "tailwindcss" },
				automatic_installation = true,
			})
			require("lspconfig").pyright.setup({
				capabilities = capabilities,
				settings = {
					python = {
						analysis = {
							typeCheckingMode = "off",
							diagnosticSeverityOverrides = {
								reportGeneralTypeIssues = "none", -- Ignore general type issues
								reportOptionalMemberAccess = "none", -- Ignore optional member access issues
							},
						},
					},
				},
				filetypes = { "python" },
			})
			require("lspconfig").gopls.setup({
				capabilities = capabilities,
				cmd = { "gopls" },
				filetypes = { "go", "gomod", "gowork", "gotmpl" },
				root_dir = require("lspconfig").util.root_pattern("go.work", "go.mod", ".git"),
				settings = {
					gopls = {
						completeUnimported = true,
						analysis = {
							unusedparams = true,
						},
					},
				},
			})
			require("lspconfig").tailwindcss.setup({
				capabilities = capabilities,
				filetypes = { "css", "typescript", "typescriptreact", "typescript.tsx" },
			})
			require("lspconfig").tsserver.setup({
				on_attach = function(client, bufnr)
					client.resolved_capabilities.document_formatting = false
					client.resolved_capabilities.document_range_formatting = false
					local ts_utils = require("nvim-lsp-ts-utils")
					ts_utils.setup({})
					ts_utils.setup_client(client)
					bufnr = vim.api.nvim_get_current_buf()
					vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
				end,
				filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
				cmd = { "typescript-language-server", "--stdio" },
				capabilities = capabilities,
			})
		end,
	},
}
