local servers = {
  "pyright",
  "gopls",
  "bashls",
  "yamlls",
  "lua_ls",
  "jsonls",
}

local yaml_schema_mappings = {
  -- Kubernetes Schema
  kubernetes = {
    "configmap",
    "deployment",
    "service",
    "ingress",
    "secret",
  },
  -- Kustomize Schema
  ["https://json.schemastore.org/kustomization.json"] = {
    "kustomization",
  },
  -- GitLab Schema
  ["https://gitlab.com/gitlab-org/gitlab/-/raw/master/app/assets/javascripts/editor/schema/ci.json"] = {
    ".gitlab-ci",
    "-common",
    "-template",
  },
}

return {
  {
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
        ensure_installed = servers,
        automatic_installation = true,
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local lspconfig = require("lspconfig")
      local keymap = vim.keymap
      local opts = { noremap = true, silent = true }
      local on_attach = function(client, bufnr)
        opts.buffer = bufnr
        keymap.set('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
        keymap.set('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
        keymap.set('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
        keymap.set('v', 'gr', '<Cmd>lua vim.lsp.buf.rename()<CR>', opts)
        keymap.set('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
        if vim.bo.filetype == "yaml" or vim.bo.filetype == "yml" then
          local bufname = vim.api.nvim_buf_get_name(bufnr)
          local filename = vim.fn.fnamemodify(bufname, ":t") -- Get just the filename
          -- Find the matching schema
          local selected_schema = nil
          for schema_url, patterns in pairs(yaml_schema_mappings) do
            for _, pattern in ipairs(patterns) do
              if filename:match("^" .. pattern) then
                selected_schema = schema_url
                break
              end
            end
            if selected_schema then break end
          end

          -- Apply the schema dynamically
          if selected_schema then
            client.config.settings.yaml.schemas = { [selected_schema] = "*" }
          end

        end
      end
      for _, server in pairs(servers) do
        local lsp_opts = { on_attach = on_attach }
        local success, settings = pcall(require, "david.plugins.code.lang." .. server)

        if success then
          lspconfig[server].setup(vim.tbl_deep_extend("force", settings, lsp_opts))
        else
          lspconfig[server].setup(lsp_opts)
        end
      end

      vim.diagnostic.config {
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = '',
            [vim.diagnostic.severity.WARN] = '',
            [vim.diagnostic.severity.HINT] = '',
            [vim.diagnostic.severity.INFO] = '',
          },
        },
        virtual_text = false,
        update_in_insert = false,
        underline = true,
        severity_sort = true,
        float = {
          focusable = true,
          style = "minimal",
          border = "rounded",
          header = "",
          prefix = "",
        },
      }

      vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
      vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })
      require("lspconfig.ui.windows").default_options.border = "rounded"

    end
  },
  {
    'stevearc/conform.nvim',
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    opts = {
      formatters_by_ft = {
        lua = { "stylua" },
        sh = { "shfmt" },
        go = { "goimports", "gofmt" },
        python = { "ruff_format" },
        json = { "jq" },
        ["*"] = { "lsp" }
      },
      format_on_save = {
        timeout_ms = 500,
        lsp_fallback = true
      },
    },
    init = function()
      vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
    end,
  }
}
