return {
  "brenton-leighton/multiple-cursors.nvim",
  version = "*",
  opts = {},
  keys = {
    { "<leader>mk",    "<Cmd>MultipleCursorsAddUp<CR>",            mode = { "n", "x" }, desc = "Add cursor and move up" },
    { "<leader>mj",    "<Cmd>MultipleCursorsAddDown<CR>",          mode = { "n", "x" }, desc = "Add cursor and move down" },

    { "<C-LeftMouse>", "<Cmd>MultipleCursorsMouseAddDelete<CR>",   mode = { "n", "i" }, desc = "Add or remove cursor" },

    { "<Leader>ma",    "<Cmd>MultipleCursorsAddMatches<CR>",       mode = { "n", "x" }, desc = "Add cursors to cword" },
    { "<Leader>mA",    "<Cmd>MultipleCursorsAddMatchesV<CR>",      mode = { "n", "x" }, desc = "Add cursors to cword in previous area" },

    { "<Leader>md",    "<Cmd>MultipleCursorsAddJumpNextMatch<CR>", mode = { "n", "x" }, desc = "Add cursor and jump to next cword" },
    { "<Leader>mD",    "<Cmd>MultipleCursorsJumpNextMatch<CR>",    mode = { "n", "x" }, desc = "Jump to next cword" },

    { "<Leader>ml",    "<Cmd>MultipleCursorsLock<CR>",             mode = { "n", "x" }, desc = "Lock virtual cursors" },
  },
}
