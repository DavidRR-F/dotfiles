return {
  'stevearc/dressing.nvim',
  config = function()
    require('dressing').setup({
      select = {
        backend = { 'telescope', 'builtin' },
      },
    })
  end
}
