return {
  "nvim-treesitter/nvim-treesitter",
  run = ":TSUpdate",
  config = function()
    require'nvim-treesitter.configs'.setup {
      ensure_installed = { "python", "dockerfile", "html", "css", "regex", "go", "lua", "json", "markdown", "markdown_inline" }, -- Add the languages here
      sync_install = false, -- Install languages synchronously (only applied to `ensure_installed`)
      highlight = {
        enable = true, -- Enable Tree-sitter based highlighting
      },
      indent = {
        enable = true, -- Enable Tree-sitter based indentation
      },
    }
  end
}
