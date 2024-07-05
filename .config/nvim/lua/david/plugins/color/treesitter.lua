return {
  "nvim-treesitter/nvim-treesitter",
  run = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        "python",
        "dockerfile",
        "html",
        "c_sharp",
        "css",
        "sql",
        "javascript",
        "bash",
        "regex",
        "lua",
        "json",
        "xml",
        "yaml",
        "markdown",
        "markdown_inline",
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
  end
}
