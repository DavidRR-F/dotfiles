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
        keymap.set('n', '<C-i>', vim.lsp.buf.hover, opts)
      end
      local capabilities = cmp_nvim_lsp.default_capabilities()
      capabilities.textDocument.completion.completionItem.snippetSupport = true

      -- python
      local python = require("david.plugins.code.lang.python")
      lspconfig.pyright.setup(python.lsp(on_attach, capabilities))

      -- go
      local go = require("david.plugins.code.lang.go")
      lspconfig.gopls.setup(go.lsp(on_attach, capabilities, lspconfig.util.root_pattern("go.work", "go.mod", ".git")))

      -- bash
      lspconfig.bashls.setup({
        on_attach = on_attach,
        capabilities = capabilities,
      })

      -- powershell
      lspconfig.powershell_es.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        bundle_path = vim.fn.stdpath("data") .. "/mason/packages/powershell-editor-services/"
      })

      -- lua
      lspconfig.lua_ls.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
            },
          },
        },
      })

      -- yaml
      lspconfig.yamlls.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        settings = {
          yaml = {
            schemas = {
              ["http://json.schemastore.org/github-workflow"] = "/.github/workflows/*",
              ["http://json.schemastore.org/github-action"] = "/.github/action/*",
              ["https://kubernetesjsonschema.dev/v3.0.0"] = "/kubernetes/*",
              ["https://raw.githubusercontent.com/docker/compose/master/compose.schema.json"] = "/docker-compose/*",
              ["http://json.schemastore.org/ansible-stable-2.9"] = "/roles/*",
            },
          },
        },
      })

      -- json
      lspconfig.jsonls.setup({
        on_attach = on_attach,
        capabilities = capabilities,
      })

      -- docker
      lspconfig.dockerls.setup({
        on_attach = on_attach,
        capabilities = capabilities,
      })

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

      -- html
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
