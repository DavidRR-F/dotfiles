return {
  'ThePrimeagen/harpoon',
  branch = "harpoon2",
  requires = { 'nvim-lua/plenary.nvim' },
  config = function()
    local harpoon = require('harpoon')
    local keymap = vim.keymap
    harpoon.setup({
      global_settings = {
        save_on_toggle = false,
        sync_on_ui_close = false,
        tabline = true
      }
    })

    keymap.set("n", "<leader>h", function() harpoon:list():add() end)
    keymap.set("n", "<S-Tab>", function() harpoon:list():prev() end)
    keymap.set("n", "<Tab>", function() harpoon:list():next() end)
    keymap.set("n", "<leader>fh", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

    keymap.set("n", "<leader>h1", function() harpoon:list():select(1) end)
    keymap.set("n", "<leader>h2", function() harpoon:list():select(2) end)
    keymap.set("n", "<leader>h3", function() harpoon:list():select(3) end)
    keymap.set("n", "<leader>h4", function() harpoon:list():select(4) end)
  end
}
