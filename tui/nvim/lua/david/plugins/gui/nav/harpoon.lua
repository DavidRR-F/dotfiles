return {
  'ThePrimeagen/harpoon',
  branch = "harpoon2",
  requires = { 'nvim-lua/plenary.nvim', 'nvim-telescope/telescope.nvim' },
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
    vim.keymap.set("n", "<leader>fh", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

    vim.keymap.set("n", "<leader>h1", function() harpoon:list():select(1) end)
    vim.keymap.set("n", "<leader>h2", function() harpoon:list():select(2) end)
    vim.keymap.set("n", "<leader>h3", function() harpoon:list():select(3) end)
    vim.keymap.set("n", "<leader>h4", function() harpoon:list():select(4) end)

--    local conf = require("telescope.config").values
--    local function toggle_telescope(harpoon_files)
--      local file_paths = {}
--      for _, item in ipairs(harpoon_files.items) do
--        table.insert(file_paths, item.value)
--      end
--
--      require("telescope.pickers").new({}, {
--        prompt_title = "Harpoon",
--        finder = require("telescope.finders").new_table({
--          results = file_paths,
--        }),
--        previewer = conf.file_previewer({}),
--        sorter = conf.generic_sorter({}),
--      }):find()
--    end
--
--    vim.keymap.set("n", "<leader>fh", function() toggle_telescope(harpoon:list()) end,
--      { desc = "Open harpoon window" })
  end
}
