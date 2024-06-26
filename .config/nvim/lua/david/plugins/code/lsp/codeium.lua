return {
  'Exafunction/codeium.vim',
  config = function()
    vim.g.codeium_disable_bindings = 1
    vim.keymap.set('i', '<C-f>', function() return vim.fn['codeium#Accept']() end, { expr = true, silent = true })
    vim.cmd [[autocmd BufEnter,BufNewFile *.md let g:codeium_enabled = v:false]]
  end
}
