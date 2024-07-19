local opt = vim.opt
opt.number = true
opt.relativenumber = true
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

opt.wrap = false

opt.ignorecase = true
opt.smartcase = true

opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

opt.backspace = "indent,eol,start"

opt.splitright = true
opt.splitbelow = true

opt.fillchars = { eob = " " }

opt.conceallevel = 2

-- folding

opt.foldlevel = 5
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"

-- spelling

opt.spell = true
opt.spelllang = "en_us"
vim.api.nvim_create_autocmd("TermOpen", {
  pattern = "*",
  callback = function()
    vim.opt_local.spell = false
  end,
})
