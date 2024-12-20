return {
  'kevinhwang91/nvim-ufo',
  dependencies = 'kevinhwang91/promise-async',
  config = function()
    require('ufo').setup({
      provider_selector = function(_, _, _)
        return { 'treesitter', 'indent' }
      end
    })
    vim.api.nvim_set_hl(0, 'UfoFoldedEllipsis', { fg = '#1e88e5' })
  end
}
