return {
  "bullets-vim/bullets.vim",
  ft = { "markdown" },
  init = function()
    vim.g.bullets_enabled_file_types = { "markdown" }
    _G.tab_or_demote = function()
      local line = vim.api.nvim_get_current_line()
      local col = vim.fn.col('.') - 1
      if line:match("^%s*[%*%+%-] ") then
        return vim.api.nvim_replace_termcodes("<Plug>(bullets-demote)", true, true, true)
      else
        return vim.api.nvim_replace_termcodes("<Tab>", true, true, true)
      end
    end
    vim.api.nvim_set_keymap('i', '<Tab>', 'v:lua.tab_or_demote()', { expr = true, noremap = true })
    vim.api.nvim_set_keymap('i', '<S-Tab>', '<Plug>(bullets-promote)', { noremap = false, silent = true })
  end
}
