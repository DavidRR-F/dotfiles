return {
  "nvim-treesitter/nvim-treesitter",
  run = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        "python",
        "go",
        "c",
        "cpp",
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
        "yaml",
        "markdown",
        "markdown_inline",
        "terraform",
        "hcl"
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
    vim.cmd [[
            au BufRead,BufNewFile Jenkinsfile set filetype=groovy
        ]]
  end,
}
