return {
  "Mofiqul/vscode.nvim",
  config = function()
    require("vscode").setup({
      transparent = true,
      disable_nvimtree_bg = true
    })
    require('vscode').load()  
  end
}
