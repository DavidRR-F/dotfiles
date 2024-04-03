local colors = {
        h1 = "#ff0000",
        h2 = "#00ff00",
        h3 = "#0000ff",
        h4 = "#ffff00",
        h5 = "#ff00ff",
        h6 = "#00ffff",
        -- Add more colors for other header levels as needed
    }


return {
	"nvim-treesitter/nvim-treesitter",
	run = ":TSUpdate",
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = {
				"python",
				"dockerfile",
				"html",
				"css",
        "sql",
				"javascript",
				"typescript",
				"tsx",
				"bash",
				"regex",
				"go",
				"lua",
				"json",
				"markdown",
				"markdown_inline",
        "terraform" 
			}, -- Add the languages here
			sync_install = false, -- Install languages synchronously (only applied to `ensure_installed`)
			highlight = {
				enable = true,
			},
			indent = {
				enable = true, -- Enable Tree-sitter based indentation
			},
		})
  end,
}
