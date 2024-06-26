local opt = vim.opt
opt.number = true

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
