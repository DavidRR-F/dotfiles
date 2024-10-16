return {
  'stevearc/conform.nvim',
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      go = { "goimports", "gofmt" },
      python = { "ruff_format" },
      hcl = { "packer_fmt" },
      terraform = { "terraform_fmt" },
      yaml = { "yamlfix" },
      javascript = { { "prettierd", "prettier" } },
    },
    format_on_save = { timeout_ms = 500, lsp_fallback = false },
    formatters = {
      shfmt = {
        prepend_args = { "-i", "2" },
      },
      yamlfix = {
        command = "yamlfix",
        env = {
          YAMLFIX_SEQUENCE_STYLE = "block_style",
        },
      },
    },
  },
  init = function()
    vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
  end,
}
