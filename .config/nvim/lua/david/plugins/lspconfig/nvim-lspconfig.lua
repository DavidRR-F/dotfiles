return {
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
		},
		config = function()
			local lspconfig = require("lspconfig")
			local cmp_nvim_lsp = require("cmp_nvim_lsp")
			local keymap = vim.keymap
			local opts = { noremap = true, silent = true }
			local on_attach = function(client, bufnr)
				opts.buffer = bufnr
        vim.keymap.set('n', '<C-k>', vim.lsp.buf.hover, opts)
			end
			local capabilities = cmp_nvim_lsp.default_capabilities()
		  capabilities.textDocument.completion.completionItem.snippetSupport = true	

      local function get_python_path(workspace)
        -- Default to a .venv in the workspace directory if it exists, otherwise the system Python
        local venv_path = workspace .. "/.venv/bin/python"
        return vim.fn.filereadable(venv_path) == 1 and venv_path or "python"
      end

			lspconfig.pyright.setup({
				on_attach = on_attach,
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
            pythonPath = get_python_path(vim.fn.getcwd()),
					},
				},
        filetypes = { "python" },
			})
			lspconfig.gopls.setup({
				cmd = { "gopls" },
        single_file_support = true,
				on_attach = on_attach,
				capabilities = capabilities,
				filetypes = { "go", "gomod", "gowork", "gotmpl" },
				root_dir = lspconfig.util.root_pattern("go.work", "go.mod", ".git"),
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
			})
			lspconfig.tailwindcss.setup({
				on_attach = on_attach,
				capabilities = capabilities,
				filetypes = { "css", "typescript", "typescriptreact", "typescript.tsx", "templ" },
			})
			lspconfig.emmet_ls.setup({
				on_attach = on_attach,
				capabilities = capabilities,
				filetypes = { "html", "typescriptreact", "javascriptreact", "typescript.tsx", "css", "sass", "scss", "less", "templ" },
			})
			lspconfig.cssls.setup({
				on_attach = on_attach,
				capabilities = capabilities,
			})
			lspconfig.html.setup({
				on_attach = on_attach,
				capabilities = capabilities,
			})
			lspconfig.tsserver.setup({
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
