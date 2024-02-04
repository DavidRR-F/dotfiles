return {
    {
      "bluz71/vim-nightfly-guicolors",
      priority = 1000, -- make sure to load this before all the other start plugins
      config = function()
        -- load the colorscheme here
        vim.cmd([[colorscheme nightfly]])
        -- transparent background
        --vim.cmd([[hi Normal guibg=NONE ctermbg=NONE]])
        --vim.cmd([[hi NormalNC guibg=NONE ctermbg=NONE]])
      end,
    },
}