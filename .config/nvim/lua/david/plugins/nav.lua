return {
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.5',
        dependencies = {
            'nvim-lua/plenary.nvim',
            "radyz/telescope-gitsigns",
        },
        keys = {
            { "<C-z>", "<cmd>Telescope buffers<cr>",                                                 desc = "Buffers" },
            { "<C-s>", "<cmd>Telescope find_files<cr>",                                              desc = "Find Files" },
            { "<C-e>", "<cmd>Telescope git_status<cr>",                                              desc = "Find Changes" },
            { "<C-x>", "<cmd>Telescope git_sign<cr>",                                                desc = "Find File Changes" },
            { "<C-w>", "<cmd>:lua require('telescope').extensions.git_worktree.git_worktrees()<cr>", desc = "Switch Branch" },
        
        },
        config = function()
            require('telescope').setup({
            defaults = {
                file_ignore_patterns = { '.pytest_cache', '__pycache__', 'node_modules', '.venv', '.git' },
            },
            })
        end,
    },
    {
    'ThePrimeagen/harpoon',
    config = function()
        require("harpoon").setup({})
        vim.keymap.set("n", "<C-a>", require("harpoon.ui").toggle_quick_menu)
        vim.keymap.set("n", "<Tab>", function() require("harpoon.ui").nav_next() end)
        vim.keymap.set("n", "<S-Tab>", function() require("harpoon.ui").nav_prev() end)
        vim.keymap.set("n", "<Leader>a", function() require("harpoon.mark").add_file() end)
        vim.keymap.set("n", "<Leader>ad", function() require("harpoon.mark").rm_file() end)
        vim.keymap.set("n", "<Leader>ac", function() require("harpoon.cmd-ui").clear_all() end)
    end
    },
    {
        "nvim-tree/nvim-tree.lua",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
          vim.g.loaded_netrw = 1
          vim.g.loaded_netrwPlugin = 1
          vim.opt.termguicolors = true
          vim.cmd([[ highlight NvimTreeFolderArrowClosed guifg=#3FC5FF ]])
          vim.cmd([[ highlight NvimTreeFolderArrowOpen guifg=#3FC5FF ]])
          local nvimtree = require("nvim-tree")
          nvimtree.setup({
            disable_netrw = true,
            hijack_netrw = true,
            hijack_cursor = true,
            hijack_unnamed_buffer_when_opening = true,
            sync_root_with_cwd = true,
            filters = {
              dotfiles = false,
              custom = {
                'node_modules',
                '__pycache__',
                '.venv',
                '.git'
              },
              exclude = {
                '.gitignore'
              },
            },
            update_focused_file = {
              enable = true,
              update_root = false,
            },
            view = {
              adaptive_size = false,
              side = "left",
              width = 30,
              preserve_window_proportions = true,
            },
            git = {
              enable = true,
              ignore = false,
            },
            filesystem_watchers = {
              enable = true,
            },
            actions = {
              open_file = {
                resize_window = true,
              },
            },
            renderer = {
              root_folder_label = false,
              highlight_git = true,
              highlight_opened_files = "none",
      
              indent_markers = {
                enable = false,
              },
      
              icons = {
                show = {
                  file = true,
                  folder = true,
                  folder_arrow = true,
                  git = true,
                },
      
                glyphs = {
                  default = "󰈚",
                  symlink = "",
                  folder = {
                    default = "",
                    empty = "",
                    empty_open = "",
                    open = "",
                    symlink = "",
                    symlink_open = "",
                    arrow_open = "",
                    arrow_closed = "",
                  },
                  git = {
                    unstaged = "✗",
                    staged = "✓",
                    unmerged = "",
                    renamed = "➜",
                    untracked = "★",
                    deleted = "",
                    ignored = "◌",
                  },
                },
              },
            },
          })
          local keymap = vim.keymap                                                                    -- for conciseness
          keymap.set('n', '<C-g>', "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" })       -- toggle file explorer
        end,
      }
}