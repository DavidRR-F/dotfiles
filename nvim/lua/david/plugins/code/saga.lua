return {
    'nvimdev/lspsaga.nvim',
    config = function()
        require('lspsaga').setup({
          lightbulb = {
            enable = false,
            sign = false,
            virtual_text = false
          },
          rename = {
            auto_save = true
          }
        })
    end,
    dependencies = {
        'nvim-treesitter/nvim-treesitter',
        'nvim-tree/nvim-web-devicons',
    }
}
