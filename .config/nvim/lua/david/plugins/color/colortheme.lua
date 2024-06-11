return {
  "Mofiqul/vscode.nvim",
  config = function()
    require("vscode").setup({
      transparent = true,
      disable_nvimtree_bg = true,
      color_overrides = {
        vscBack = 'NONE',
        vscPopupBack = 'NONE',
        vscFoldBackground = 'NONE',
      }
    })
    require('vscode').load()
  end
}
