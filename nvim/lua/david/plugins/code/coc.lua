
return {
  "neoclide/coc.nvim",
  branch = "release",
  event = "BufReadPre",
  config = function()
    vim.g.coc_global_extensions = {
      "coc-yaml",
      "coc-sh",
      "coc-json",
      "coc-go",
      "coc-pyright",
      "coc-java",
      "coc-vetur",
      "coc-html",
      "coc-css",
      "coc-tsserver",
      "coc-prettier",
      "coc-eslint",
    }

    -- Keybindings
    local keymap = vim.api.nvim_set_keymap
    local opts = { noremap = true, silent = true }

    -- Show definition on hover
    keymap("n", "K", "<cmd>lua vim.fn.CocActionAsync('doHover')<CR>", opts)

    -- Go to definition
    keymap("n", "gd", "<Plug>(coc-definition)", {})

    -- Format file
    keymap("n", "<leader>cf", "<cmd>CocCommand editor.action.formatDocument<CR>", opts)

    -- Show diagnostics
    keymap("n", "<leader>cd", "<cmd>CocDiagnostics<CR>", opts)

    -- Dap Keymaps
    keymap("n", "<leader>dd", "<cmd>CocCommand dap.debugStart<CR>", opts)  -- Start debugging
    keymap("n", "<leader>di", "<cmd>CocCommand dap.stepInto<CR>", opts)   -- Step into
    keymap("n", "<leader>do", "<cmd>CocCommand dap.stepOver<CR>", opts)   -- Step over
    keymap("n", "<leader>dc", "<cmd>CocCommand dap.continue<CR>", opts)   -- Continue
    keymap("n", "<leader>db", "<cmd>CocCommand dap.toggleBreakpoint<CR>", opts)  -- Toggle breakpoint
  end,
}
