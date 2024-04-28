return {
  "malbertzard/inline-fold.nvim",
  opts = {
    defaultPlaceholder = "…",
    queries = {
      html = {
        { pattern = 'class="([^"]*)"', placeholder = "@" }, -- classes in html
        { pattern = 'href="(.-)"' }, -- hrefs in html
        { pattern = 'src="(.-)"' }, -- HTML img src attribute
      }
    },
  },
  config = function()
    require("inline-fold").setup()
    vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWinEnter' }, {
      pattern = { '*.html', '*.tsx' },
      callback = function(_)
        if not require('inline-fold.module').isHidden then
          vim.cmd('InlineFoldToggle')
        end
      end,
    })
  end
}
