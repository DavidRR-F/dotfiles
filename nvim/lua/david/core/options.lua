local opt = vim.opt
opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true
opt.wildmenu = true
opt.wildmode = "longest:full,full"

opt.cmdheight = 0
opt.wrap = false

opt.ignorecase = true
opt.smartcase = true

opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

-- no windows/tabs
opt.showtabline = 0
opt.winbar = nil
opt.laststatus = 2

opt.backspace = "indent,eol,start"

opt.splitright = true
opt.splitbelow = true

opt.fillchars = { eob = " " }

opt.conceallevel = 2

-- folding

opt.foldlevel = 8
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"

-- spelling

opt.spell = true
opt.spelllang = "en_us"

-- terminal

vim.api.nvim_create_autocmd("TermOpen", {
    pattern = "*",
    callback = function()
        vim.wo.number = false
        vim.wo.relativenumber = false
    end,
})

-- diagnostic

vim.diagnostic.config({
  virtual_text = false,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = false,
})

vim.fn.sign_define('DiagnosticSignError', { text = '', texthl = 'DiagnosticSignError' })
vim.fn.sign_define('DiagnosticSignWarn', { text = '', texthl = 'DiagnosticSignWarn' })
vim.fn.sign_define('DiagnosticSignInfo', { text = '', texthl = 'DiagnosticSignInfo' })
vim.fn.sign_define('DiagnosticSignHint', { text = '', texthl = 'DiagnosticSignHint' })

-- global variables

vim.g.lang = {
  mason = {
    dap = {
      "python",
      "bash",
      "delve"
    },
    lsp = {
      "pyright",
      "bashls",
      "gopls",
      "yamlls",
      "lua_ls"
    }
  },
  config_paths = {
      "david.plugins.code.lang.python",
      "david.plugins.code.lang.bash",
      "david.plugins.code.lang.go",
      "david.plugins.code.lang.lua",
      "david.plugins.code.lang.yaml"
  }
}
