return {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    -- optionally enable 24-bit colour
    config = function()
        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1
        vim.opt.termguicolors = true
        vim.cmd([[ highlight NvimTreeFolderArrowClosed guifg=#3FC5FF ]])
        vim.cmd([[ highlight NvimTreeFolderArrowOpen guifg=#3FC5FF ]])
        local nvimtree = require("nvim-tree")
        nvimtree.setup({
            view = {
              width = 35,
              relativenumber = true,
            },
            -- change folder arrow icons
            renderer = {
              indent_markers = {
                enable = true,
              },
              icons = {
                glyphs = {
                  folder = {
                    arrow_closed = "", -- arrow when folder is closed
                    arrow_open = "", -- arrow when folder is open
                  },
                },
              },
            },
            -- disable window_picker for
            -- explorer to work well with
            -- window splits
            actions = {
              open_file = {
                window_picker = {
                  enable = false,
                },
              },
            },
            filters = {
              custom = { ".DS_Store" },
            },
            git = {
              ignore = false,
            },
          })
      
          -- set keymaps
          local keymap = vim.keymap -- for conciseness
      
          keymap.set('n', '<C-n>', "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" }) -- toggle file explorer
        end,
}