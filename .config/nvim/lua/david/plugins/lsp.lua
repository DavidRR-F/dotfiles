return {
    {
        'Exafunction/codeium.vim',
        config = function()
          vim.g.codeium_disable_bindings = 1
          vim.keymap.set('i', '<C-f>', function() return vim.fn['codeium#Accept']() end, { expr = true, silent = true })
          vim.cmd [[autocmd BufEnter,BufNewFile *.md let g:codeium_enabled = v:false]]
        end
      },
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
            ensure_installed = {
                "lua_ls",
            },
            automatic_installation = true,
            })
        end
    },
    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        dependencies = {
          "hrsh7th/cmp-buffer",
          "hrsh7th/cmp-path",
          "L3MON4D3/LuaSnip",
          "saadparwaiz1/cmp_luasnip",
          "rafamadriz/friendly-snippets",
          "hrsh7th/cmp-nvim-lsp-signature-help",
          "onsails/lspkind-nvim",
        },
        config = function()
          local cmp = require("cmp")
          local luasnip = require("luasnip")
          require("luasnip.loaders.from_vscode").lazy_load()
          cmp.setup({
            completion = {
              completeopt = "menu,menuone,noselect",
            },
            snippet = {
              expand = function(args)
                luasnip.lsp_expand(args.body)
              end,
            },
            mapping = cmp.mapping.preset.insert({
              ["<CR>"] = cmp.mapping.confirm({ select = true }),
              ["<C-e>"] = cmp.mapping.abort(),
              ["<Tab>"] = cmp.mapping.select_next_item(),
              ["<S-Tab>"] = cmp.mapping.select_prev_item()
            }),
            sources = cmp.config.sources({
              { name = "nvim_lsp" },
              { name = "luasnip" },
              { name = "buffer" },
              { name = "path" },
              { name = 'nvim_lsp_signature_help' },
              { name = "codeium" }
            }),
            window = {
              completion = cmp.config.window.bordered(),
              documentation = cmp.config.window.bordered(),
            },
          })
        end,
      },
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
          keymap.set('n', '<C-k>', vim.lsp.buf.hover, opts)
        end
        local capabilities = cmp_nvim_lsp.default_capabilities()
        capabilities.textDocument.completion.completionItem.snippetSupport = true
  
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
    end
    }
  }