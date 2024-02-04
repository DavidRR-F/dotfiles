function OpenFileInNewTab()
  local lib = require'nvim-tree.lib'
  local node = lib.get_node_at_cursor()
  if node then
      vim.cmd('tabnew ' .. node.absolute_path)
  end
end

return {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    -- optionally enable 24-bit colour
    config = function()
        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1
        vim.opt.termguicolors = true
        vim.api.nvim_exec([[
        autocmd VimEnter * NvimTreeOpen
        autocmd VimEnter * wincmd p
        ]], false)
        vim.cmd([[ highlight NvimTreeFolderArrowClosed guifg=#3FC5FF ]])
        vim.cmd([[ highlight NvimTreeFolderArrowOpen guifg=#3FC5FF ]])
        local nvimtree = require("nvim-tree")
        nvimtree.setup({
          disable_netrw = true,
          hijack_netrw = true,
          hijack_cursor = true,
          hijack_unnamed_buffer_when_opening = false,
          sync_root_with_cwd = true,
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
            enable = false,
            ignore = true,
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
            highlight_git = false,
            highlight_opened_files = "none",
        
            indent_markers = {
              enable = false,
            },
        
            icons = {
              show = {
                file = true,
                folder = true,
                folder_arrow = true,
                git = false,
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
      
          -- set keymaps
          local keymap = vim.keymap -- for conciseness
          keymap.set('n', '<C-n>', "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" }) -- toggle file explorer
        end,
}