return {
  "benlubas/molten-nvim",
  version = "^1.0.0",
  dependencies = { "3rd/image.nvim" },
  build = ":UpdateRemotePlugins",
  init = function()
    local term = require("david.custom.terminal")
    if term.is_wezterm_terminal() then
      vim.g.molten_image_provider = "wezterm"
    end
    vim.g.molten_auto_open_output = false
    vim.g.molten_output_show_more = true
    vim.g.molten_output_win_max_height = 80
    vim.g.molten_split_direction = "right"
    vim.g.molten_split_size = 40
    vim.g.molten_virt_text_output = true
    vim.g.molten_virt_text_max_lines = 1
    vim.g.molten_use_border_highlights = true
    vim.g.molten_virt_lines_off_by_1 = false
    vim.g.molten_auto_image_popup = true
    vim.g.molten_wrap_output = true
    vim.g.molten_output_win_border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" }

    vim.keymap.set('n', '<leader>ms', ':MoltenShowOutput<CR>', { noremap = true, silent = true })
    vim.keymap.set('n', '<leader>mh', ':MoltenHideOutput<CR>', { noremap = true, silent = true })
    vim.keymap.set('n', '<leader>me', ':MoltenEnterOutput<CR>', { noremap = true, silent = true })
    vim.keymap.set('n', '<leader>me', ':MoltenDeinit<CR>', { noremap = true, silent = true })
    vim.keymap.set('n', '<leader>mi', ':MoltenInit<CR>', { noremap = true, silent = true })
    vim.keymap.set('n', '<leader>mr', ':MoltenRestart<CR>', { noremap = true, silent = true })
  end,

}
