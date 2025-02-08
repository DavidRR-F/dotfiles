local servers = {
  "pyright",
  "gopls",
  "bashls",
  "yamlls",
  "lua_ls",
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
    'nvimdev/lspsaga.nvim',
    config = function()
        require('lspsaga').setup({
          lightbulb = {
            enable = false,
            sign = false,
            virtual_text = false
          },
          rename = {
            auto_save = true
          },
        })
    end,
    dependencies = {
        'nvim-treesitter/nvim-treesitter',
        'nvim-tree/nvim-web-devicons',
    }
  },
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      'nvimdev/lspsaga.nvim',
    },
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
        keymap.set('n', 'gl', '<cmd>Lspsaga show_line_diagnostics<CR>', opts)
      end
      for _, server in ipairs(servers) do
        local lsp_opts = { on_attach = on_attach }
        local success, settings = pcall(require, "david.plugins.code.lang." .. server)

        if success then
          lspconfig[server].setup(vim.tbl_deep_extend("force", settings, lsp_opts))
        else
          lspconfig[server].setup(lsp_opts)
        end
      end
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
