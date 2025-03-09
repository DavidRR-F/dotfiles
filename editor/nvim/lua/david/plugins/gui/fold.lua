return {
  'kevinhwang91/nvim-ufo',
  dependencies = 'kevinhwang91/promise-async',
  config = function()
    require('ufo').setup({
      provider_selector = function(bufnr, filetype, buftype)
        if filetype == 'markdown' then
          return { 'indent' }
        end
        return { 'treesitter', 'indent' }
      end
    })
    vim.api.nvim_set_hl(0, 'UfoFoldedEllipsis', { fg = '#1e88e5' })
  end
}
