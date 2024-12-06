return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {'nvimdev/lspsaga.nvim'},
    config = function()
      local lspconfig = require("lspconfig")
      local lspsaga = require("lspsaga")
      lspsaga.setup({
        ui = {
          code_action = ' '
        },
        rename = {
          auto_save = true
        }
      })
      -- keybindings
      local keymap = vim.keymap
      local opts = { noremap = true, silent = true }
      local on_attach = function(_, bufnr)
        opts.buffer = bufnr
        keymap.set('n', 'gh', '<Cmd>Lspsaga lsp_finder<CR>', opts)
        keymap.set('n', 'K', '<Cmd>Lspsaga hover_doc<CR>', opts)
        keymap.set('n', 'gd', '<Cmd>Lspsaga goto_definition<CR>', opts)
        keymap.set('n', 'gr', '<Cmd>Lspsaga lsp_finder<CR>', opts)
        keymap.set('v', 'gr', '<Cmd>Lspsaga rename<CR>', opts)
        keymap.set('n', 'gD', '<Cmd>Lspsaga peek_definition<CR>', opts)
      end
      -- python
      lspconfig.pyright.setup({
        on_attach = on_attach,
        settings = {
          python = {
            analysis = {
              typeCheckingMode = "off",
              useLibraryCodeForTypes = true,
              diagnosticSeverityOverrides = {
                reportGeneralTypeIssues = "none",
                reportOptionalMemberAccess = "none",
              },
            },
          },
        },
        filetypes = { "python" },
      })

      -- go
      lspconfig.gopls.setup({
        cmd = { "gopls" },
        single_file_support = true,
        on_attach = on_attach,
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

      -- bash
      lspconfig.bashls.setup({
        on_attach = on_attach,
        filetypes = {"bash"}
      })

      -- powershell
      lspconfig.powershell_es.setup({
        on_attach = on_attach,
        filetypes = {"powershell"},
        bundle_path = vim.fn.stdpath("data") .. "/mason/packages/powershell-editor-services/"
      })

      -- lua
      lspconfig.lua_ls.setup({
        on_attach = on_attach,
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
        filetypes = {"yaml"},
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
        filetypes = {"json"}
      })

      -- docker
      lspconfig.dockerls.setup({
        on_attach = on_attach,
        filetypes = {"dockerfile"}
      })

      -- emmet
      lspconfig.emmet_ls.setup({
        on_attach = on_attach,
        filetypes = { "html", "typescriptreact", "javascriptreact", "typescript.tsx", "css", "sass", "scss", "less", "templ" },
      })

      -- css
      lspconfig.cssls.setup({
        on_attach = on_attach,
        filetypes = { "html", "typescriptreact", "javascriptreact", "typescript.tsx", "css", "sass", "scss", "less", "templ" },
      })

      -- html
      lspconfig.html.setup({
        on_attach = on_attach,
        filetypes = { "html", "typescriptreact", "javascriptreact", "typescript.tsx", "css", "sass", "scss", "less", "templ" },
      })
    end,
  },
}
