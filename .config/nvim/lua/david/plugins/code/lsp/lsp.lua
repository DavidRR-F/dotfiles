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

      -- keybindings
			local keymap = vim.keymap
			local opts = { noremap = true, silent = true }
			local on_attach = function(client, bufnr)
				opts.buffer = bufnr
        vim.keymap.set('n', '<C-k>', vim.lsp.buf.hover, opts)
			end
			local capabilities = cmp_nvim_lsp.default_capabilities()
		  capabilities.textDocument.completion.completionItem.snippetSupport = true

      -- python
      local python = require("david.plugins.code.lang.python")
			lspconfig.pyright.setup(python.lsp(on_attach, capabilities))
      
      -- go 
      local go = require("david.plugins.code.lang.go")
			lspconfig.gopls.setup(go.lsp(on_attach, capabilities, lspconfig.util.root_pattern("go.work", "go.mod", ".git")))

      -- c and cpp 
      local c = require("david.plugins.code.lang.c")
      lspconfig.clangd.setup(c.lsp(on_attach, capabilities))

      -- tailwind
			lspconfig.tailwindcss.setup({
				on_attach = on_attach,
				capabilities = capabilities,
				filetypes = { "css", "typescript", "typescriptreact", "typescript.tsx", "templ" },
			})

      -- emmet
			lspconfig.emmet_ls.setup({
				on_attach = on_attach,
				capabilities = capabilities,
				filetypes = { "html", "typescriptreact", "javascriptreact", "typescript.tsx", "css", "sass", "scss", "less", "templ" },
			})

      -- css
			lspconfig.cssls.setup({
				on_attach = on_attach,
				capabilities = capabilities,
			})
			lspconfig.html.setup({
				on_attach = on_attach,
				capabilities = capabilities,
			})

      -- typescript 
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
