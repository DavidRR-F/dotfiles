return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      'nvimdev/lspsaga.nvim',
      'nvim-java/nvim-java'
    },
    config = function()
      local lspconfig = require("lspconfig")
      local yaml_schemas = require("david.custom.yaml_schema").yaml_schemas
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

      -- java
      require("java").setup()
      lspconfig.jdtls.setup({
        on_attach = on_attach,
        filetypes = { "java" }
      })

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
                [yaml_schemas["Generic"]] = "*", -- Default schema
                [yaml_schemas["Kubernetes"]] = "/*.k8s.yaml",
                [yaml_schemas["Ansible"]] = "/*.ansible.yaml",
                [yaml_schemas["GitLab CI"]] = "/.gitlab-ci.yml",
                [yaml_schemas["GitHub Actions"]] = "/.github/workflows/*.yml",
                [yaml_schemas["Helm"]] = "/charts/**/*.yaml",
                [yaml_schemas["Docker Compose"]] = "/docker-compose*.yml",
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
    end
  },
}
