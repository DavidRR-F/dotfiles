return {
  {
    "saghen/blink.cmp",
    opts = {
      keymap = {
        preset = "default",
        ["<C-f>"] = { "select_and_accept" },
      },
    },
  },
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        "bash-language-server",
        "shellcheck",
        "shfmt",
        "pyright",
        "ruff",
        "pyproject-fmt",
        "gopls",
        "goimports",
        "yaml-language-server",
        "yamlfmt",
        "yamllint",
        "jq",
        "stylua",
        "emmet-language-server",
        "typescript-language-server",
        "terraform",
        "hclfmt"
      },
    },
  },
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    opts = {
      formatters_by_ft = {
        lua = { "stylua" },
        sh = { "shfmt" },
        go = { "goimports" },
        json = { "jq" },
        ["*"] = { "lsp" },
      },
      format_on_save = {
        timeout_ms = 500,
        lsp_fallback = true,
      },
    },
    init = function()
      vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
    end,
  },
}
