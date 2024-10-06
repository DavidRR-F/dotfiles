
return {
  "nvchad/minty",
  lazy = true,
  dependencies = { "nvchad/volt", lazy = true },
  keys = {
    { "<C-m>", "<cmd>:lua require('minty.huefy').open( { border = true } )<CR>", desc = "Color Picker"}
  } 
}
