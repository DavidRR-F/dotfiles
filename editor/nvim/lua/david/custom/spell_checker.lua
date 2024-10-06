local M = {}

M.spell_suggest_popup = function()
  local suggestions = vim.fn.spellsuggest(vim.fn.expand('<cword>'))

  if vim.tbl_isempty(suggestions) then
    vim.api.nvim_out_write('No suggestions\n')
    return
  end

  vim.ui.select(suggestions, { prompt = 'Spell Suggestions:' }, function(choice)
    if choice then
      vim.api.nvim_command('normal! ciw' .. choice)
    end
  end)
end

return M
