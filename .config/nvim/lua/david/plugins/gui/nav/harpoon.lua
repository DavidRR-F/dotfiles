return {
  'ThePrimeagen/harpoon',
  config = function()
    require("harpoon").setup({
      global_settings = {
        tabline = true
      }
    })
    vim.keymap.set("n", "<C-a>", require("harpoon.ui").toggle_quick_menu)
    vim.keymap.set("n", "<Tab>", function() require("harpoon.ui").nav_next() end)
    vim.keymap.set("n", "<S-Tab>", function() require("harpoon.ui").nav_prev() end)
    vim.keymap.set("n", "<Leader>a", function() require("harpoon.mark").add_file() end)
    vim.keymap.set("n", "<Leader>ad", function() require("harpoon.mark").rm_file() end)
    vim.keymap.set("n", "<Leader>ac", function() require("harpoon.cmd-ui").clear_all() end)
  end
}
