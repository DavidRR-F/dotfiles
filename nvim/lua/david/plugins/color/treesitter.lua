return {
  "nvim-treesitter/nvim-treesitter",
  run = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        "python",
        "java",
        "c",
        "go",
        "ruby",
        "perl",
        "dockerfile",
        "html",
        "css",
        "sql",
        "javascript",
        "typescript",
        "tsx",
        "bash",
        "regex",
        "lua",
        "json",
        "xml",
        "html",
        "yaml",
        "nginx",
        "markdown",
        "markdown_inline",
        "terraform",
        "hcl",
        "vimdoc"
      },
      sync_install = false,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      indent = {
        enable = true,
      },
    })
  end,
}
