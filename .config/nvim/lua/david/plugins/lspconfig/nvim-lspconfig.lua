local function set_python_path(path)
  local clients = vim.lsp.get_active_clients {
    bufnr = vim.api.nvim_get_current_buf(),
    name = 'pyright',
  }
  for _, client in ipairs(clients) do
    if client.settings then
      client.settings.python = vim.tbl_deep_extend('force', client.settings.python, { pythonPath = path })
    else
      client.config.settings = vim.tbl_deep_extend('force', client.config.settings, { python = { pythonPath = path } })
    end
    client.notify('workspace/didChangeConfiguration', { settings = nil })
  end
end

-- Auto-command to set Python path from .venv on buffer enter
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*.py",
  callback = function()
    local venv_path = vim.fn.getcwd() .. '/.venv/bin/python'
    if vim.fn.filereadable(venv_path) == 1 then
      set_python_path(venv_path)
    else
      print("Python interpreter not found in .venv")
    end
  end
})


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
        --vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
			end
			local capabilities = cmp_nvim_lsp.default_capabilities()
		  capabilities.textDocument.completion.completionItem.snippetSupport = true	
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
					},
				},
        commands = {
          PyrightSetPythonPath = {
            set_python_path,
            description = 'Reconfigure pyright with the provided python path',
            nargs = 1,
            complete = 'file',
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
				filetypes = { "css", "typescript", "typescriptreact", "typescript.tsx" },
			})
			lspconfig.emmet_ls.setup({
				on_attach = on_attach,
				capabilities = capabilities,
				filetypes = { "html", "typescriptreact", "javascriptreact", "typescript.tsx", "css", "sass", "scss", "less" },
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
