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
			}, -- Add the languages here
			sync_install = false, -- Install languages synchronously (only applied to `ensure_installed`)
			highlight = {
				enable = true,
        additional_vim_regex_highlighting = false,
			},
			indent = {
				enable = true, -- Enable Tree-sitter based indentation
			},
		})
    vim.cmd [[
            au BufRead,BufNewFile Jenkinsfile set filetype=groovy
        ]]
  end,
}
