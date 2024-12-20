return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {'nvimdev/lspsaga.nvim'},
    config = function()
      local lspconfig = require("lspconfig")
      local keymap = vim.keymap
      local opts = { noremap = true, silent = true }
      local on_attach = function(_, bufnr)
        opts.buffer = bufnr
        keymap.set('n', 'K', '<Cmd>Lspsaga hover_doc<CR>', opts)
        keymap.set('n', 'gd', '<Cmd>Lspsaga goto_definition<CR>', opts)
        keymap.set('v', 'gr', '<Cmd>Lspsaga rename<CR>', opts)
        keymap.set('n', 'gD', '<Cmd>Lspsaga peek_definition<CR>', opts)
        keymap.set('n', '<space>e', '<cmd>Lspsaga show_line_diagnostics<CR>', opts)
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
              ["https://raw.githubusercontent.com/docker/compose/master/compose.schema.json"] = "/docker-compose/*",
            },
          },
        },
      })

      -- ansible
      lspconfig.ansiblels.setup({
        on_attach = on_attach,
        filetypes = { "yaml.ansible" },
        settings = {
          ansible = {
            ansible = {
              path = "ansible"
            },
            executionEnvironment = {
              enabled = false
            },
            python = {
              interpreterPath = "python"
            },
            validation = {
              enabled = true,
              lint = {
                enabled = true,
                path = "ansible-lint"
              }
            }
          }
        }
      })

      -- helm
      lspconfig.helm_ls.setup({
        on_attach = on_attach,
        capabilities = {
          workspace = {
            didChangeWatchedFiles = {
              dynamicRegistration = true
            }
          }
        },
        cmd = { "helm_ls", "serve" },
        filetypes = { "helm" }
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
    end
  },
}
