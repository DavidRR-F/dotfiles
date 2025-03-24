local opt = vim.opt

opt.wrap = true
opt.textwidth = 80
opt.number = false
opt.relativenumber = true

opt.spell = true
opt.spelllang = "en_us"

opt.breakindent = true
opt.breakindentopt = "shift:2,sbr"
opt.showbreak = "-> "

opt.comments = "fb:-,fb:*,fb:+,fb:1.,fb:a.,fb:A."
opt.formatoptions = "cqj"
opt.formatlistpat = [[^\\s*\\d\\+[\\]:.)}\\t ]\\s*\\|^\\s*[a-zA-Z]\\+[\\]:.)}\\t ]\\s*\\|^\\s*[-*+]\\s\\+]]

opt.linebreak = true
