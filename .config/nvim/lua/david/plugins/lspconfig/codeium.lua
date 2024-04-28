return {
    'Exafunction/codeium.vim',
    config = function ()
    -- ignore default bindings
      vim.g.codeium_disable_bindings = 1
    -- Change '<C-t>' here to any keycode you like for autocomplete
    vim.keymap.set('i', '<C-s>', function () return vim.fn['codeium#Accept']() end, { expr = true, silent = true })    
    -- Ignore Markdown files
      vim.cmd [[autocmd BufEnter,BufNewFile *.md let g:codeium_enabled = v:false]]
  end
}
