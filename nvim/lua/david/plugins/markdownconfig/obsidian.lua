return {
  "epwalsh/obsidian.nvim",
  version = "*",
  lazy = true,
  ft = "markdown",
  dependencies = {
    "nvim-lua/plenary.nvim"
  },
  cmd = {
    'ObsidianOpen',
    'ObsidianNew',
    'ObsidianFollowLink',
    'ObsidianSearch',
    'ObsidianPasteImg',
  },
  opts = {
    workspaces = {
      {
        name = "work",
        path = "~/Documents/ObsidianWork",
      },
      {
        name = "personal",
        path = "~/Documents/Obsidian",
      },
    },
  },
}
